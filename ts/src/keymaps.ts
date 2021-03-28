import { map } from "./utils";

const setKeymaps = () => {
  const n = { noremap: true };
  const ns = { noremap: true, silent: true };

  map.nmap("<leader>s", ":source $MYVIMRC<CR>", n);

  map.imap("jj", "<ESC>", ns);

  map.nmap("k", "gk", n);
  map.nmap("gk", "k", n);
  map.nmap("j", "gj", n);
  map.nmap("gj", "j", n);

  map.nmap("<C-e>", ":CocCommand explorer<CR>", ns);

  map.tmap("<ESC>", `<C-\\><C-n>`, n);
  map.nmap("<C-t>n", ":FloatermNew<CR>", ns);
  map.tmap("<C-t>h", `<C-\\><C-n>:FloatermHide<CR>`, ns);
  map.tmap("<C-t>x", `<C-\\><C-n>:FloatermKill<CR>`, ns);
  map.nmap("<C-t>s", ":FloatermShow<CR>", ns);
  map.nmap("<C-t>k", ":FloatermPrev<CR>", ns);
  map.nmap("<C-t>j", ":FloatermNext<CR>", ns);
  map.nmap("<C-t>k", `<C-\\><C-n>:FloatermPrev<CR>`, ns);
  map.tmap("<C-t>j", `<C-\\><C-n>:FloatermNext<CR>`, ns);

  vim.g.vimspector_enable_mappings = "HUMAN";

  map.nmap("<C-p>", ":Clap files<CR>", ns);

  map.nmap(" <Space><Space>", ":HopWord<CR>", ns);
};
export default setKeymaps;
