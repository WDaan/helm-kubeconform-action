# Helm Kubeconform Action

A flexible GitHub Action to validate [Helm charts](https://helm.sh/docs/topics/charts/) with [Kubeconform](https://github.com/yannh/kubeconform/).

## Usage

Assuming you have a `charts` directory under which you have a
set of charts and a `schemas` directory containing any custom
resource schemas, like this:

```
charts
└───foo
│  ├───templates
│  └───tests
└───bar
│  ├───templates
│  └───tests
└───schemas
```

## Example usage in workflow

```yaml
name: Chart Test
on: [push] 
jobs:
    kubeconform:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Validate Helm Chart
      uses: wdaan/helm-kubeconform-action@v0.1.4
      with:
        additionalSchemaPaths: |
          schemas/{{ .ResourceKind }}.json
        chartsDirectory: "charts"
        ignoreMissingSchemas: "true"
        kubernetesVersion: "1.25.0"
```

[See action.yml for more information on the parameters.](action.yml)

### Schemas

The [default Kubernetes
schema](https://github.com/yannh/kubernetes-json-schema/) will always
be automatically included. If you need to add custom schemas,
`additionalSchemaPaths` should be a list of paths, one per line, [in
the format expected by
Kubeconform](https://github.com/yannh/kubeconform/blob/d536a659bdb20ee6d06ab55886b348cd1c0fa21b/Readme.md#overriding-schemas-location---crd-and-openshift-support).
These are relative to the root of your repository.

### Tests

Every chart subdirectory must have a `tests` subdirectory
containing values files [as you would pass to
Helm](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing).
Each file will be passed on its own to `helm template release
charts/MY_CHART` and the results will be validated by
Kubeconform.
