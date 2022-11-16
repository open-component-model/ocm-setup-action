# Open Component Model CLI setup action

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
