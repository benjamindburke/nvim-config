return {
    "mbbill/undotree",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile" },
    keys  = require("nvim-config.keys.undotree")
}
