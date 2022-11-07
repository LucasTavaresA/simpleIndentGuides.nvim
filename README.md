# simpleIndentGuides.nvim

Indentation guides using the builtin `shiftwidth` and `listchars` variables.

## Installation

[packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use {
  'lucastavaresa/simpleIndentGuides.nvim',
  config = function()
    require("simpleIndentGuides").setup()
  end
}
```

## Usage

**You have to use setup() to use any command**

You can toggle the guides with the `:SIGToggle` command

## Customization

Setup can receive a string to be the indentation guide,
the second character is used as the padding between the guides

The default indicator is `│ `

Example:
```lua
require("simpleIndentGuides").setup("┊·")
```
