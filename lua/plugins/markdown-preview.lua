return {
    -- dir = "~/Documents/personal/markdown-preview.nvim/",
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
        { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
    build = ':call mkdp#util#install()',
    ft = { "markdown" },
}
