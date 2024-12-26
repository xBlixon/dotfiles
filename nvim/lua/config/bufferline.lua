vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        offsets = {
            {
                filetype = 'NvimTree',
                text = '  Files',
                highlight = 'StatusLine',
                text_align = 'left',
            },
        },
        modified_icon = ''
    }
}
