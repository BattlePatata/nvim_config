local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_create_user_command("LspClients", function()
    local clients = vim.lsp.get_active_clients()
    for _, client in pairs(clients) do
        print("Client: " .. client.name .. " (ID: " .. client.id .. ") - Buffer: " .. client.bufnr)
    end
end, {})

require("vim-options")
require("lazy").setup("plugins")
