return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require("neoscroll")

    local easing = "linear"
    local zz_time_ms = 100
    local jump_time_ms = 100

    neoscroll.setup({
      post_hook = function(info)
        if info ~= "center" then
          return
        end

        local defer_time_ms = 10
        vim.defer_fn(function()
          neoscroll.zz(zz_time_ms, easing)
        end, defer_time_ms)
      end,
    })

    local keymap = {
      ["<C-u>"] = function()
        neoscroll.scroll(-vim.wo.scroll, true, jump_time_ms, easing)
      end,
      ["<C-d>"] = function()
        neoscroll.scroll(vim.wo.scroll, true, jump_time_ms, easing)
      end,
    }

    local modes = { "n", "v", "x" }

    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
