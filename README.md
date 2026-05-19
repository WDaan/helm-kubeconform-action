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

#### CRD schemas via datreeio catalog

Set `datreeioCrdCatalog: "true"` to automatically resolve CRD schemas from the
[datreeio/CRDs-catalog](https://github.com/datreeio/CRDs-catalog). This covers
a large number of popular CRDs (Argo Rollouts, cert-manager, Crossplane, etc.)
with no extra configuration:

```yaml
- name: Validate Helm charts
  uses: WDaan/helm-kubeconform-action@v1
  with:
    chartsDirectory: charts
    kubernetesVersion: "1.32.0"
    datreeioCrdCatalog: "true"
```

Kubeconform resolves schemas on-demand per resource type during validation.
Standard Kubernetes resources are unaffected — they resolve via the default
schema location and never hit the catalog. This option requires outbound HTTPS
access to `raw.githubusercontent.com` and is not suitable for air-gapped
environments; use `additionalSchemaPaths` instead in those cases.

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
