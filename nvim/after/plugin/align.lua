local aligner = require("align")
vim.keymap.set('x', 'ga', function() aligner.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
