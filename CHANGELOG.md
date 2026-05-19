# Changelog

## [1.2.0](https://github.com/WDaan/helm-kubeconform-action/compare/v1.1.0...v1.2.0) (2026-05-19)


### Features

* add datreeioCrdCatalog input to resolve CRD schemas automatically ([#10](https://github.com/WDaan/helm-kubeconform-action/issues/10)) ([9031333](https://github.com/WDaan/helm-kubeconform-action/commit/9031333c9a7987b4daabc66186292e3dd0d07094))

## [1.1.0](https://github.com/WDaan/helm-kubeconform-action/compare/v1.0.1...v1.1.0) (2026-05-11)


### Features

* add optional fallback to chart default values when no test values files exist ([#9](https://github.com/WDaan/helm-kubeconform-action/issues/9)) ([bfb7dff](https://github.com/WDaan/helm-kubeconform-action/commit/bfb7dff0d0d1bdea0fdb89409d5ab52103f91d8c))


### Bug Fixes

* invalid YAML escape in action.yml default value for regexSkipDir ([#7](https://github.com/WDaan/helm-kubeconform-action/issues/7)) ([b37a471](https://github.com/WDaan/helm-kubeconform-action/commit/b37a471766be05bb31a0a4e3c961791ca35e8289))

## [1.0.1](https://github.com/WDaan/helm-kubeconform-action/compare/v1.0.0...v1.0.1) (2026-05-11)


### Bug Fixes

* resolve release workflow `setup-go` failure by removing Windows matrix and modernizing action refs ([#5](https://github.com/WDaan/helm-kubeconform-action/issues/5)) ([5ad928d](https://github.com/WDaan/helm-kubeconform-action/commit/5ad928d757c2a2d10106ca9d385dd279ba9f64fc))

## [1.0.0](https://github.com/WDaan/helm-kubeconform-action/compare/v0.3.0...v1.0.0) (2026-05-11)


### ⚠ BREAKING CHANGES

* improve logging with zerolog
* make configuration more uniform

### Features

* **action:** add logging configuration ([f261670](https://github.com/WDaan/helm-kubeconform-action/commit/f26167074694aafc38ef7b6c8c4c28e5e729284a))
* add ability to update dependencies ([b89bac3](https://github.com/WDaan/helm-kubeconform-action/commit/b89bac3fb0d47f2b0f9dbc2b49d444edc8b709ad))
* add action template ([bf6f6f3](https://github.com/WDaan/helm-kubeconform-action/commit/bf6f6f34c35468c22efa946ff483a8b8e131dc3b))
* add pretty logging ([d28827a](https://github.com/WDaan/helm-kubeconform-action/commit/d28827ad5e8b7b6999d3500fd038654a662a1676))
* add trace logging ([5774f82](https://github.com/WDaan/helm-kubeconform-action/commit/5774f82d42acb1851eb85d758efdb1427b7c6499))
* allow configuring log level ([ef5430c](https://github.com/WDaan/helm-kubeconform-action/commit/ef5430c80d054692d38a8af9826260b7a3482b69))
* always update dependencies in action ([4c03b5d](https://github.com/WDaan/helm-kubeconform-action/commit/4c03b5d21e13f82fd21c6443d892b212dba3afd9))
* default to `charts` for `chartsDirectory` ([1d5428f](https://github.com/WDaan/helm-kubeconform-action/commit/1d5428fbb825eb3bfb5a5bc8c4ab3923f55ff405))
* implement Docker build ([947d078](https://github.com/WDaan/helm-kubeconform-action/commit/947d078035397cb6088480eeddcee10a4f5f00ad))
* implement Go command ([5787aea](https://github.com/WDaan/helm-kubeconform-action/commit/5787aea7879327c1d1b38ea41add65968c967309))
* support missing schemas ([7381d01](https://github.com/WDaan/helm-kubeconform-action/commit/7381d0103ecc2c81fbd5b6a565aa78ee816ba665))
* update codebase, add Dependabot and release please as well as basic CI ([2756275](https://github.com/WDaan/helm-kubeconform-action/commit/2756275a66c5f0ae5c1f44403bf2fac67e4f2247))


### Bug Fixes

* action name ([e15c563](https://github.com/WDaan/helm-kubeconform-action/commit/e15c5631afb8758a189382189252e6f0828aaaed))
* **action.yml:** don’t use `github` context ([4c16dd1](https://github.com/WDaan/helm-kubeconform-action/commit/4c16dd152043cfcd206d85104800b5138bc16f11))
* **action:** add `required` where required ([59bee62](https://github.com/WDaan/helm-kubeconform-action/commit/59bee6272536fcc27fcf879dd8cbbfe85508c863))
* add `envDefault` to `KubernetesVersion` ([54e5644](https://github.com/WDaan/helm-kubeconform-action/commit/54e56442d17759fd622e6b302118a472834a4767))
* delete CODEOWNERS ([5ab1563](https://github.com/WDaan/helm-kubeconform-action/commit/5ab1563766a776f998df86eb8e984ca67f3285f6))
* drop local schema paths ([8b8cd5e](https://github.com/WDaan/helm-kubeconform-action/commit/8b8cd5e29d6d3ac457b9ff0f8559ed339a8bdd0d))
* give unique name to action ([1c8c13b](https://github.com/WDaan/helm-kubeconform-action/commit/1c8c13b69912060ecffcb501d126cff9c982d1b1))
* ignore empty `additionalSchemaPaths` ([19ee262](https://github.com/WDaan/helm-kubeconform-action/commit/19ee262bbce7e513954575fe2473fb52e8e08bb5))
* ignore missing schemas ([3465068](https://github.com/WDaan/helm-kubeconform-action/commit/3465068610d5588a0f9d1302dff67d08d678a0c0))
* inputs ([07f33e2](https://github.com/WDaan/helm-kubeconform-action/commit/07f33e2bf3027b6b07012ca8646545b8a6fdac90))
* logging ([d3d6e5c](https://github.com/WDaan/helm-kubeconform-action/commit/d3d6e5c785176dfebe56225d21821b79c665eee3))
* make release on tag ([b00e222](https://github.com/WDaan/helm-kubeconform-action/commit/b00e222fc3db005582f9944dd0eab627263d421d))
* release artifacts ([7ef8066](https://github.com/WDaan/helm-kubeconform-action/commit/7ef80664bfad088cdbc491558f9ce793bc306974))
* remove unused `Config.OutputFormat` ([c59fc25](https://github.com/WDaan/helm-kubeconform-action/commit/c59fc251dd160e6040efb0e663ebd9b57cceef27))
* update go, dockerfile ([cdb1e33](https://github.com/WDaan/helm-kubeconform-action/commit/cdb1e3378f8533af9257fba6d5550d535f0e64b4))


### Performance Improvements

* Drop vendored Go deps, refresh module versions, and align README with current action release ([#3](https://github.com/WDaan/helm-kubeconform-action/issues/3)) ([e50e603](https://github.com/WDaan/helm-kubeconform-action/commit/e50e60370a3b713327d16fff39d7b16dbf5f833e))


### Code Refactoring

* improve logging with zerolog ([1e99ebc](https://github.com/WDaan/helm-kubeconform-action/commit/1e99ebcd7d10272fd92e6a90f54434b1946cdb1e))
* make configuration more uniform ([0cadc48](https://github.com/WDaan/helm-kubeconform-action/commit/0cadc48e3c7d27e585b72ad891843b9db0c7c241))

## [0.3.0](https://github.com/shivjm/helm-kubeconform-action/compare/v0.2.0...v0.3.0) (2024-02-14)


### Features

* allow skipping directories ([d231947](https://github.com/shivjm/helm-kubeconform-action/commit/d231947060daf79af952e5756b95eddda2b43c50))
* allow validating a single chart directory ([8292f61](https://github.com/shivjm/helm-kubeconform-action/commit/8292f611662fa1f409b370e3837dc40c9ff2ca41))
* propagate JSON output from kubeconform upon validation error ([bb9fc5c](https://github.com/shivjm/helm-kubeconform-action/commit/bb9fc5cbd80c2d9882c260ed0b30c3a4f91f98ef))
* validate all charts and report all failures ([e45a5c8](https://github.com/shivjm/helm-kubeconform-action/commit/e45a5c8a6dce87e8bb79785a37879a659b532b71))


### Bug Fixes

* correctly handle kubeconform not being executed ([52c4151](https://github.com/shivjm/helm-kubeconform-action/commit/52c4151e3b4129f945040ec8648a9ff549e92237))
* remove extraneous output when log level is unparseable ([c8c211b](https://github.com/shivjm/helm-kubeconform-action/commit/c8c211bea42ffc3c54987364d5571c57840e8f70))
* simplify logging ([c89dac8](https://github.com/shivjm/helm-kubeconform-action/commit/c89dac8d99f1fca42ce1971062df1c3412af4b90))
