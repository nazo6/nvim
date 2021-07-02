const colors = {
  blue: '#007acc',
  white: '#ffffff',
  green: '#16825d',
  gray: '#3C3C3C',
  lightred: '#D16969',
  pink: '#C586C0',
  black: '#262626'
};

const nvcode = {
  normal: {
    a: { fg: colors.white, bg: colors.green, gui: 'bold' },
    b: { fg: colors.white, bg: colors.blue },
    c: { fg: colors.white, bg: colors.blue }
  },
  visual: {
    a: { fg: colors.black, bg: colors.pink, gui: 'bold' },
    b: { fg: colors.white, bg: colors.blue },
    c: { fg: colors.white, bg: colors.blue }
  },
  inactive: {
    a: { fg: colors.white, bg: colors.gray, gui: 'bold' },
    b: { fg: colors.white, bg: colors.blue },
    c: { fg: colors.white, bg: colors.blue }
  },
  replace: {
    a: { fg: colors.black, bg: colors.lightred, gui: 'bold' },
    b: { fg: colors.white, bg: colors.blue },
    c: { fg: colors.white, bg: colors.blue }
  },
  insert: {
    a: { fg: colors.black, bg: colors.blue, gui: 'bold' },
    b: { fg: colors.white, bg: colors.blue },
    c: { fg: colors.white, bg: colors.blue }
  }
};

require('lualine').setup({
  options: {
    theme: 'codedark'
  },
  sections: {
    lualine_a: [['mode', { upper: true }]],
    lualine_b: [['diagnostics', { sources: ['nvim_lsp'] }]],
    lualine_c: [['filename', { file_status: true, path: 1 }], 'branch'],
    lualine_x: ['fileformat', 'encoding'],
    lualine_y: ['filetype'],
    lualine_z: ['location']
  },
  inactive_sections: {
    lualine_a: [],
    lualine_b: [],
    lualine_c: ['filename'],
    lualine_x: ['location'],
    lualine_y: [],
    lualine_z: []
  }
});
