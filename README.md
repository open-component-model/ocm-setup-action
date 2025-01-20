# Open Component Model CLI setup action

[![REUSE status](https://api.reuse.software/badge/github.com/open-component-model/ocm-setup-action)](https://api.reuse.software/info/github.com/open-component-model/ocm-setup-action)

This GitHub Action installs a dedicated version of the ocm-cli to be used in further steps. For example, it could be used in a Makefile executed as subsequent step to build a project.

## Inputs

### `version`

**Optional** The ocm-cli version to install. By default the latest version is installed.

### `repo`

**Optional** The repository of the ocm-cli to install. Default `"open-component-model/ocm"`.

## Example usage

```yaml

jobs:
  ocm-setup-action:
    runs-on: ubuntu-latest
    name: ocm-setup-action
    steps:
      - uses: open-component-model/ocm-setup-action@main
        with:
          version: v0.19.0
      - run: ocm --version
```

## Licensing

Copyright 2025 SAP SE or an SAP affiliate company and Open Component Model contributors.
Please see our [LICENSE](LICENSE) for copyright and license information.
Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/open-component-model/ocm-setup-action).
