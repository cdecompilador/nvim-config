return {
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "theprimeagen/harpoon",
        config = function(_, _)
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            local term = require("harpoon.term")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

            vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

            vim.keymap.set("n", "<leader>t", function() term.gotoTerminal(1) end)
        end
    }
}
