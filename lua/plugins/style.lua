return {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
        style = "cool",
        code_style = {
            comments = "none"
        }
    },
    init = function()
        require("onedark").load()
    end
}
