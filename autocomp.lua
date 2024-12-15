-- html autocomplete

local default_html_template = [[
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Title</title>
  </head>
<body>

</body>
</html>
]]

vim.api.nvim_set_keymap('n', '<leader>ht', ':lua InsertHTMLTemplate()<CR>', { noremap = true, silent = true })

function InsertHTMLTemplate()
    local lines = vim.split(default_html_template, "\n")
    vim.api.nvim_buf_set_lines(0, vim.fn.line('.'), vim.fn.line('.'), false, lines)
end

