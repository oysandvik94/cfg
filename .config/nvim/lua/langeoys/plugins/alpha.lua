return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function (_, dashboard)
        require('alpha').setup(dashboard.opts)
    end,
    opts = function()
		local dashboard = require('alpha.themes.dashboard')
		local header = {
	"       ,                                  ",
	"       \\`-._           __                 ",
	"        \\\\  `-..____,.'  `.               ",
	"         :`.         /    \\`.             ",
	"         :  )       :      : \\            ",
	"          ;'        '   ;  |  :           ",
	"          )..      .. .:.`.;  :           ",
	"         /::...  .:::...   ` ;            ",
	"         ; _ '    __        /:\\           ",
	"         `:o>   /\\o_>      ;:. `.         ",
	"        `-`.__ ;   __..--- /:.   \\        ",
	"        === \\_/   ;=====_.':.     ;       ",
	"         ,/'`--'...`--....        ;       ",
	"              ;                    ;      ",
	"            .'                      ;     ",
	"          .'                        ;     ",
	"        .'     ..     ,      .       ;    ",
	"       :       ::..  /      ;::.     |    ",
	"      /      `.;::.  |       ;:..    ;    ",
	"     :         |:.   :       ;:.    ;     ",
	"     :         ::     ;:..   |.    ;      ",
	"      :       :;      :::....|     |      ",
	"      /\\     ,/ \\      ;:::::;     ;      ",
	"    .:. \\:..|    :     ; '.--|     ;      ",
	"   ::.  :''  `-.,,;     ;'   ;     ;      ",
	".-'. _.'\\      / `;      \\,__:      \\     ",
	"`---'    `----'   ;      /    \\,.,,,/     ",
	"                   `----`                 "		}
		dashboard.section.header.val = header
		dashboard.section.buttons.val = {
			dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
			dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
			dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
			dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
			dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
			dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = 'AlphaHeader'
			button.opts.hl_shortcut = 'AlphaHeader'
		end
        dashboard.section.terminal.width = 70
		dashboard.section.terminal.height = 10
		dashboard.section.terminal.opts.redraw = true
		dashboard.section.terminal.opts.window_config.zindex = 1
		return dashboard
	end,
};
