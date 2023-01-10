local ok_neogen, neogen = pcall(require, 'neogen')
if not ok_neogen then
   print ("neogen is not available")
   return
end

local items = require("neogen.types.template").item

local doxygen_style_annotation = {
   { nil, "//----------------------------------------------------------------------------------------", { no_results = true, type = {"file"}}},
   { nil, "/// @author Durnov Dmitriy", { type = { "func", "class", "type" } } },
   { nil, "/// @file", { no_results = true, type = { "file" } } },
   { nil, "/// @brief $1", { no_results = true, type = { "func", "file", "class" } } },
   { nil, "//----------------------------------------------------------------------------------------", { no_results = true, type = {"file"}}},
   { nil, "", { no_results = true, type = {"file"}}},

   { items.ClassName, "/// @class %s", { type = { "class" } } },
   { items.Type, "/// @typedef %s", { type = { "type" } } },
   { nil, "/// @brief $1", { type = { "func", "class", "type" } } },
   { items.Tparam, "/// @tparam %s $1" },
   { items.Parameter, "/// @param %s $1" },
   { items.Return, "/// @return $1" },
   { nil, "//========================================================================================", { type = { "func", "class", "type" } } },
}

neogen.setup({
   languages = {
      cpp = {
         template = {
            annotation_convention = "doxygen_style",
            doxygen_style = doxygen_style_annotation
         }
      }
   }
})

-- mapping
local map = vim.api.nvim_set_keymap
map('n', '<leader>dg', ":Neogen<CR>", { noremap = true, silent = true })

