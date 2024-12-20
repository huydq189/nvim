return {
  {
    -- messages, cmdline and the popupmenu
    {
      "folke/noice.nvim",
      opts = function(_, opts)
        table.insert(opts.routes, {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        })
        local focused = true
        vim.api.nvim_create_autocmd("FocusGained", {
          callback = function()
            focused = true
          end,
        })
        vim.api.nvim_create_autocmd("FocusLost", {
          callback = function()
            focused = false
          end,
        })
        table.insert(opts.routes, 1, {
          filter = {
            cond = function()
              return not focused
            end,
          },
          view = "notify_send",
          opts = { stop = false },
        })

        opts.commands = {
          all = {
            -- options for the message history that you get with `:Noice`
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {},
          },
        }

        vim.api.nvim_create_autocmd("FileType", {
          pattern = "markdown",
          callback = function(event)
            vim.schedule(function()
              require("noice.text.markdown").keys(event.buf)
            end)
          end,
        })

        opts.presets.lsp_doc_border = true
      end,
    },

    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 5000,
      },
    },

    {
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      opts = {
        plugins = {
          gitsigns = true,
          tmux = true,
          kitty = { enabled = false, font = "+2" },
        },
      },
      keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    },
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      config = function()
        local logo = [[
███████╗████████╗███████╗██████╗ ██╗  ██╗███████╗███╗   ██╗
██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║  ██║██╔════╝████╗  ██║
███████╗   ██║   █████╗  ██████╔╝███████║█████╗  ██╔██╗ ██║
╚════██║   ██║   ██╔══╝  ██╔═══╝ ██╔══██║██╔══╝  ██║╚██╗██║
███████║   ██║   ███████╗██║     ██║  ██║███████╗██║ ╚████║
╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝
     ]]
        logo = string.rep("\n", 8) .. logo .. "\n\n"
        require("dashboard").setup({
          config = {
            header = vim.split(logo, "\n"),
          },
        })
      end,
    },
  },
}
