require "nvchad.autocmds"

local function pandoc_compile(file, on_exit)
  vim.fn.mkdir("/tmp/tmppdf", "p")
  local output = "/tmp/tmppdf/" .. vim.fn.fnamemodify(file, ":t:r") .. ".pdf"
  vim.fn.jobstart({
    "pandoc", file, "-o", output, "--pdf-engine=xelatex", "-V", "papersize=a4", "-V", "geometry:margin=2cm",
  }, {
    detach = on_exit == nil,
    on_exit = on_exit,
  })
  return output
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    pandoc_compile(vim.fn.expand "%:p")
  end,
})

vim.api.nvim_create_user_command("MarkdownPreview", function()
  local file = vim.fn.expand "%:p"
  vim.fn.mkdir("/tmp/tmppdf", "p")
  local output = "/tmp/tmppdf/" .. vim.fn.fnamemodify(file, ":t:r") .. ".pdf"
  vim.fn.jobstart({
    "pandoc", file, "-o", output, "--pdf-engine=xelatex", "-V", "papersize=a4", "-V", "geometry:margin=2cm",
  }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.fn.jobstart({ "zathura", output }, { detach = true })
      else
        vim.notify("pandoc failed — check :messages", vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Compile markdown to PDF and open in zathura" })
