import { map } from "../utils";

require("Navigator").setup();

const opts = {
  noremap: true,
  silent: true,
};
map.nmap("<C-w>h", "<CMD>lua require('Navigator').left()<CR>", opts);
map.nmap("<C-w>k", "<CMD>lua require('Navigator').up()<CR>", opts);
map.nmap("<C-w>l", "<CMD>lua require('Navigator').right()<CR>", opts);
map.nmap("<C-w>j", "<CMD>lua require('Navigator').down()<CR>", opts);
map.nmap("<C-w>p", "<CMD>lua require('Navigator').previous()<CR>", opts);
