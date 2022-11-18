# Open Component Model CLI setup action

[![REUSE status](https://api.reuse.software/badge/github.com/open-component-model/ocm-setup-action)](https://api.reuse.software/info/github.com/open-component-model/ocm-setup-action)

This GitHub Action installs a dedicated version of the OCM tool to be used
in further steps. For example, it could be used in a Makefile executed as
subsequenet step to build a project.

## Inputs

### `version`

**Optional** The tool version to install. Default `"v0.1.0-alpha.1"`.

### `repo`

**Optional** The repository of the tool to install. Default `"open-component-model/ocm"`.

## Outputs

## `ocm-path`

The installation path of the tool.
It is installed into a PATH folder. Therefore it can be directly be used, also.

## Example usage

```
uses: open-component-model/ocm-setup-action@main
with:
  version: v0.1.0-alpha.1
```

## Licensing

Copyright 2022 SAP SE or an SAP affiliate company and Open Component Model contributors.
Please see our [LICENSE](LICENSE) for copyright and license information.
Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/open-component-model/ocm-setup-action).
