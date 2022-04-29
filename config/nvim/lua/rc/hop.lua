require('hop').setup()

nkeymap('a', ':<C-u>HopChar1<Cr>')
nkeymap('s', ':<C-u>HopChar2<Cr>')
nkeymap('<Leader>s', ':<C-u>HopLineVisual<Cr>')
nkeymap('<Leader>a', ':<C-u>HopChar2<Cr>')
