# Helm Kubeconform Action

A GitHub Action to validate [Helm charts](https://helm.sh/docs/topics/charts/)
with [Kubeconform](https://github.com/yannh/kubeconform/).
The target may be either a single chart directory or a directory containing
multiple charts.

## Usage

Assuming you have a `charts` directory and a `schemas` directory
containing any custom resource schemas:

```
charts
├── foo
│   ├── templates
│   └── tests
├── bar
│   ├── templates
│   └── tests
└── schemas
```

## Example usage in workflow

```yaml
name: Chart validation
on: [push] 

jobs:
  kubeconform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Validate Helm charts
        uses: WDaan/helm-kubeconform-action@v1
        with:
          additionalSchemaPaths: |
            schemas/{{ .ResourceKind }}.json
          chartsDirectory: charts
          strict: "true"
          helmUpdateDeps: "true"
          fallbackToDefaultValues: "false"
          ignoreMissingSchemas: "false"
          kubernetesVersion: "1.30.0"
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
Each file will be passed on its own to
`helm template release charts/MY_CHART` and the results will be validated by
Kubeconform.

If a chart has no test values files and `fallbackToDefaultValues` is set to
`true`, the action will fall back to running `helm template release
charts/MY_CHART` with chart default values.
