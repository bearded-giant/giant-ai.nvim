-- Giant AI Plugin Entry Point
-- This file ensures the plugin is loaded when Neovim starts

if vim.g.loaded_giant_ai then
  return
end
vim.g.loaded_giant_ai = true

-- The actual plugin setup is handled in lua/giant-ai/init.lua
-- Users call require('giant-ai').setup() in their config