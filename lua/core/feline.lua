local ok, feline = pcall(require, "feline")
if not ok then
    return
end

local colors = {
    fg = "#d0d0d0",
    bg = "#1e1e1e",
}

local components = { active = { {}, {}, {} }, inactive = { {}, {} } }

-- left
components.active[1][1] = { provider = 'vi_mode', hl = { fg = colors.bg, bg = colors.fg, style = 'bold' }, left_sep = ' ', right_sep = ' ' }
components.active[1][2] = { provider = 'git_branch', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }
components.active[1][3] = { provider = 'file_info', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }

-- middle
components.active[2][1] = { provider = 'diagnostic_errors', hl = { fg = '#e86671' } }
components.active[2][2] = { provider = 'diagnostic_warnings', hl = { fg = '#E5C07B' } }
components.active[2][3] = { provider = 'diagnostic_hints', hl = { fg = '#56B6C2' } }
components.active[2][4] = { provider = 'diagnostic_info', hl = { fg = '#61AFEF' } }

-- right
components.active[3][1] = { provider = 'file_encoding', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }
components.active[3][2] = { provider = 'file_format', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }
components.active[3][3] = { provider = 'file_type', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }
components.active[3][4] = { provider = 'position', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }

-- inactive
components.inactive[1][1] = { provider = 'file_info', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }
components.inactive[2][1] = { provider = 'position', hl = { fg = colors.fg, bg = colors.bg }, left_sep = ' ', right_sep = ' ' }

feline.setup({
    components = components,
    theme = colors,
})
