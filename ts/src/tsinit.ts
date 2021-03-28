import loadDein from "./dein";
import setKeymaps from "./keymaps";
import doSettings from "./settings";

vim.g.mapleader = " ";

loadDein();
doSettings();
setKeymaps();
