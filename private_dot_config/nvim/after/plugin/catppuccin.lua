require("catppuccin").setup({
    flavour = "latte",
    background = {
        light = "latte",
        dark = "macchiato",
    },
    highlight_overrides = {
        latte = function(latte)
            return {
                Comment = { fg = latte.green },
                Normal = { fg = latte.text },
                Constant = { fg = latte.text },
                Identifier = { fg = latte.text },
                Function = { fg = latte.text },
                Statement = { fg = latte.text },
                Operator = { fg = latte.text },
                ["@variable"] = { fg = latte.text },
                ["@variable.member"] = { fg = latte.text },
                ["@variable.parameter"] = { fg = latte.text },
                ["@variable.builtin"] = { fg = latte.blue },
                ["@function.call"] = { fg = latte.text },
                ["@punctuation"] = { fg = latte.text },
                String = { fg = latte.red },
                Character = { fg = latte.red },
                Number = { fg = latte.red },
                Float = { fg = latte.red },
                Boolen = { fg = latte.blue },
                Conditional = { fg = latte.blue },
                Repeat = { fg = latte.blue },
                Label = { fg = latte.blue },
                Keyword = { fg = latte.blue },
                Exception = { fg = latte.blue },

                PreProc = { fg = latte.blue },
                Include = { fg = latte.blue },
                Define = { link = "PreProc" }, -- preprocessor #define
                Macro = { fg = latte.blue },
                PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.  

                StorageClass = { fg = latte.blue }, -- static, register, volatile, etc.
                Structure = { fg = latte.blue }, --  struct, union, enum, etc.
                Special = { fg = latte.blue }, -- (preferred) any special symbol
                Type = { fg = latte.sapphire }, -- (preferred) int, long, char, etc.

                LineNrAbove = { fg = latte.mauve, bg = latte.surface0, bold = false },
                LineNr = { fg = latte.mauve, bg = latte.surface1, bold = true },
                LineNrBelow = { fg = latte.mauve, bg = latte.surface0, bold = false },
            }
        end,
    }
})

vim.cmd.colorscheme "catppuccin"

