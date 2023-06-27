set background=dark
if exists('g:colors_name')
hi clear
if exists('syntax_on')
syntax reset
endif
endif
let g:colors_name = 'lushwal'
highlight Normal guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight! link User Normal
highlight Bold guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=bold
highlight Boolean guifg=#434EB1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Character guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight ColorColumn guifg=#9B9296 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Comment guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=italic
highlight Conceal guifg=#888185 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight! link Whitespace Conceal
highlight Conditional guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Constant guifg=#434EB1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Cursor guifg=#330A0C guibg=#C2B7BC guisp=NONE blend=NONE gui=NONE
highlight CursorColumn guifg=#9B9296 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight CursorLine guifg=#888185 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight CursorLineNr guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight Debug guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Define guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Delimiter guifg=#735B9F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticError guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticHint guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticInfo guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticUnderlineError guifg=#5B509F guibg=NONE guisp=#5B509F blend=NONE gui=underline
highlight DiagnosticUnderlineHint guifg=#7A8399 guibg=NONE guisp=#7A8399 blend=NONE gui=underline
highlight DiagnosticUnderlineInfo guifg=#AD7B86 guibg=NONE guisp=#AD7B86 blend=NONE gui=underline
highlight DiagnosticUnderlineWarn guifg=#3355C1 guibg=NONE guisp=#3355C1 blend=NONE gui=underline
highlight DiagnosticWarn guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiffAdd guifg=#506EA5 guibg=#888185 guisp=NONE blend=NONE gui=bold
highlight! link DiffAdded DiffAdd
highlight DiffChange guifg=#AEA3A8 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight DiffDelete guifg=#5B509F guibg=#888185 guisp=NONE blend=NONE gui=bold
highlight! link DiffRemoved DiffDelete
highlight! link diffRemoved DiffDelete
highlight DiffFile guifg=#5B509F guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight DiffLine guifg=#AD7B86 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight DiffNewFile guifg=#506EA5 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight DiffText guifg=#AD7B86 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight Directory guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight EndOfBuffer guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight Error guifg=#5B509F guibg=#C2B7BC guisp=NONE blend=NONE gui=NONE
highlight ErrorMsg guifg=#5B509F guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight Exception guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Float guifg=#434EB1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight FoldColumn guifg=#AD7B86 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight Folded guifg=#C2B7BC guibg=#888185 guisp=NONE blend=NONE gui=italic
highlight Function guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Identifier guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight IncSearch guifg=#888185 guibg=#434EB1 guisp=NONE blend=NONE gui=NONE
highlight Include guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Italic guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=italic
highlight Keyword guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Label guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight LineNr guifg=#AEA3A8 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight Macro guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MatchParen guifg=#C2B7BC guibg=#AEA3A8 guisp=NONE blend=NONE gui=NONE
highlight MiniCompletionActiveParameter guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniCursorword guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=underline
highlight! link MiniCursorwordCurrent MiniCursorword
highlight MiniIndentscopePrefix guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=nocombine
highlight MiniIndentscopeSymbol guifg=#888185 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight MiniJump guifg=#AD7B86 guibg=NONE guisp=#AEA3A8 blend=NONE gui=underline
highlight MiniJump2dSpot guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=undercurl
highlight MiniStarterCurrent guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterFooter guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniStarterHeader guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniStarterInactive guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=italic
highlight MiniStarterItem guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight MiniStarterItemBullet guifg=#735B9F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterItemPrefix guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterQuery guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterSection guifg=#735B9F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineDevinfo guifg=#C2B7BC guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineFileinfo guifg=#C2B7BC guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineFilename guifg=#3355C1 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineInactive guifg=#9B9296 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeCommand guifg=#330A0C guibg=#7A8399 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeInsert guifg=#330A0C guibg=#AD7B86 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeNormal guifg=#330A0C guibg=#506EA5 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeOther guifg=#330A0C guibg=#D2CEB7 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeReplace guifg=#330A0C guibg=#5B509F guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeVisual guifg=#330A0C guibg=#434EB1 guisp=NONE blend=NONE gui=NONE
highlight MiniSurround guifg=#888185 guibg=#434EB1 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineCurrent guifg=#AEA3A8 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineFill guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniTablineHidden guifg=#506EA5 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedCurrent guifg=#C2B7BC guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedHidden guifg=#9B9296 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedVisible guifg=#C2B7BC guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineVisible guifg=#AEA3A8 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight MiniTestEmphasis guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTestFail guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTestPass guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTrailspace guifg=#5B509F guibg=#C2B7BC guisp=NONE blend=NONE gui=NONE
highlight ModeMsg guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MoreMsg guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight NonText guifg=#AEA3A8 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Number guifg=#434EB1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Operator guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PMenu guifg=#C2B7BC guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight PMenuSel guifg=#C2B7BC guibg=#AD7B86 guisp=NONE blend=NONE gui=NONE
highlight PmenuSbar guifg=#9B9296 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PmenuThumb guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PreProc guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Question guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Repeat guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Search guifg=#AEA3A8 guibg=#3355C1 guisp=NONE blend=NONE gui=NONE
highlight! link MiniTablineTabpagesection Search
highlight SignColumn guifg=#9B9296 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight Special guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpecialChar guifg=#735B9F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpecialKey guifg=#AEA3A8 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpellBad guifg=#5B509F guibg=NONE guisp=#5B509F blend=NONE gui=underline
highlight SpellCap guifg=#3355C1 guibg=NONE guisp=#3355C1 blend=NONE gui=underline
highlight SpellLocal guifg=#7A8399 guibg=NONE guisp=#7A8399 blend=NONE gui=underline
highlight SpellRare guifg=#D2CEB7 guibg=NONE guisp=#D2CEB7 blend=NONE gui=underline
highlight Statement guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight StatusLine guifg=#C2B7BC guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight StatusLineNC guifg=#9B9296 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight StatusLineTerm guifg=#506EA5 guibg=#506EA5 guisp=NONE blend=NONE gui=NONE
highlight StatusLineTermNC guifg=#3355C1 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight StorageClass guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight String guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Structure guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight TabLine guifg=#AEA3A8 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight TabLineFill guifg=#AEA3A8 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight TabLineSel guifg=#506EA5 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight Tag guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Title guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight Todo guifg=#3355C1 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight TooLong guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Type guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Typedef guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Underlined guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight VertSplit guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight! link WinSeparator VertSplit
highlight Visual guifg=#330A0C guibg=#9B9296 guisp=NONE blend=NONE gui=NONE
highlight VisualNOS guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight WarningMsg guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight WildMenu guifg=#C2B7BC guibg=#AD7B86 guisp=NONE blend=NONE gui=NONE
highlight WinBar guifg=#C2B7BC guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight WinBarNC guifg=#9B9296 guibg=#330A0C guisp=NONE blend=NONE gui=NONE
highlight gitCommitOverflow guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight gitCommitSummary guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight helpCommand guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight helpExample guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @attribute guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @boolean guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @character guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @character.special guifg=#735B9F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @comment guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=italic
highlight @conditional guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant.builtin guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant.macro guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constructor guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @debug guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @define guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @exception guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @field guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @float guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function.builtin guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function.macro guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @include guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword.function guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword.operator guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @label guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @method guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @namespace guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @none guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @number guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @operator guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @parameter guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @preproc guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @property guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.bracket guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.delimiter guifg=#C2B7BC guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.special guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @repeat guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @storageclass guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.escape guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.regex guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.special guifg=#735B9F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @symbol guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag.attribute guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag.delimiter guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.bold guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @text.danger guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.diff.add guifg=#506EA5 guibg=#888185 guisp=NONE blend=NONE gui=bold
highlight @text.diff.delete guifg=#5B509F guibg=#888185 guisp=NONE blend=NONE gui=bold
highlight @text.emphasis guifg=#D2CEB7 guibg=NONE guisp=NONE blend=NONE gui=italic
highlight @text.environment guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.environment.name guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.literal guifg=#506EA5 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.math guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.note guifg=#7A8399 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.reference guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.strike guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=strikethrough
highlight @text.title guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @text.todo guifg=#3355C1 guibg=#888185 guisp=NONE blend=NONE gui=NONE
highlight @text.underline guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=underline
highlight @text.uri guifg=NONE guibg=#888185 guisp=NONE blend=NONE gui=underline
highlight @type guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @type.builtin guifg=#AD7B86 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @type.definition guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @variable guifg=#3355C1 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @variable.builtin guifg=#5B509F guibg=NONE guisp=NONE blend=NONE gui=NONE
