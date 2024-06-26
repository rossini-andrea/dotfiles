return {
    "christoomey/vim-tmux-navigator",
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "tpope/vim-fugitive",
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
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
