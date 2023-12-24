require("util")

return function()
  require('hop').setup()

  NKeymap('a', ':<C-u>HopChar1<Cr>')
  NKeymap('s', ':<C-u>HopChar2<Cr>')
  NKeymap('<Leader>s', ':<C-u>HopLineVisual<Cr>')
  NKeymap('<Leader>a', ':<C-u>HopChar2<Cr>')
end
