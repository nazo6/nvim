declare var mapFunctions: { [id: string]: () => void };
mapFunctions = {};

declare var _G: any;
_G['callmapFunction'] = (id: string) => {
  mapFunctions[id]();
};

type OptionsType = {
  mode: 'n' | 'i' | 't';
  noremap?: boolean;
  silent?: boolean;
  expr?: boolean;
};
export const map = (id: string, key: string, options: OptionsType, command: string | (() => void)) => {
  const { mode, ...opts } = options;
  const commandText = typeof command === 'string' ? command : `:lua callmapFunction("${id}")<CR>`;
  if (typeof command !== 'string') {
    mapFunctions[id] = command;
  }
  vim.api.nvim_set_keymap(mode, key, commandText, opts);
};
