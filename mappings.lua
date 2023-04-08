-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    --
    --
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    ["<S-t>"] = {
      function() vim.cmd.tabnext() end,
      desc = "Next tab",
    },
    ["<Tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-Tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- disable the predefined tab switch mappings
    ["[b"] = false,
    ["b]"] = false,
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    ["<C-c>"] = { "<cmd> %y+ <CR><CR>", desc = "Copy the whole file" },
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
  },
  t = {
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", desc = "beginning of line" },
    ["<C-e>"] = { "<End>", desc = "end of line" },
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", desc = "move left" },
    ["<C-l>"] = { "<Right>", desc = "move right" },
    ["<C-j>"] = { "<Down>", desc = "move down" },
    ["<C-k>"] = { "<Up>", desc = "move up" },
  },
}
