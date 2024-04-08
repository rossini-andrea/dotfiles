return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        opts = {
            rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
        },
        config = true,
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup()
        end,
    }
}
