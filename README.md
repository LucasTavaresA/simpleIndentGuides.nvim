# simpleIndentGuides.nvim

Indentation guides using the builtin `shiftwidth` and `listchars` variables.

![print_07_02:48](https://user-images.githubusercontent.com/80704612/200235123-f0b1c4dc-9159-47b7-bb4a-92e1c5e658db.png)

## Installation

[packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use {
  'lucastavaresa/simpleIndentGuides.nvim',
  config = function()
    vim.opt.list = true -- enable in all buffers
    require("simpleIndentGuides").setup()
  end
}
```

## Usage

**You have to use setup() to use any command**

You can toggle the guides with the `:SIGToggle` command

## Customization

To disable the guide in specific buffers

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "org", "txt", "norg" },
  command = "setlocal nolist",
})
```

Setup can receive one or two characters,
the first one is the guide,
the second string is the padding between the guides

The default guide is `│`

Example:
```lua
require("simpleIndentGuides").setup("┊")
```

Another example:
```lua
require("simpleIndentGuides").setup("┊", "·")
```
