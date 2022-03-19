---@type Global
_G = _G

---@class Global

---- Create a mapx group
-- @vararg opts  string|table Map options
-- @param  fn    function     Function with map definitions
function group(...) end

-- Create a Normal, Visual, Select, and Operator-pending mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function map(lhs, rhs, ...) end

-- Create a Normal mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function nmap(lhs, rhs, ...) end

-- Create a Normal and Command mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function mapbang(lhs, rhs, ...) end

-- Create a Visual and Select mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function vmap(lhs, rhs, ...) end

-- Create a Visual mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function xmap(lhs, rhs, ...) end

-- Create a Select mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function smap(lhs, rhs, ...) end

-- Create an Operator-pending mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function omap(lhs, rhs, ...) end

-- Create an Insert mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function imap(lhs, rhs, ...) end

-- Create an Insert, Command, and Lang-arg mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function lmap(lhs, rhs, ...) end

-- Create a Command mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function cmap(lhs, rhs, ...) end

-- Create a Terminal mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function tmap(lhs, rhs, ...) end

-- Create a non-recursive Normal, Visual, Select, and Operator-pending mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function noremap(lhs, rhs, ...) end

-- Create a non-recursive Normal mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function nnoremap(lhs, rhs, ...) end

-- Create a non-recursive Normal and Command mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function noremapbang(lhs, rhs, ...) end

-- Create a non-recursive Visual and Select mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function vnoremap(lhs, rhs, ...) end

-- Create a non-recursive Visual mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function xnoremap(lhs, rhs, ...) end

-- Create a non-recursive Select mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function snoremap(lhs, rhs, ...) end

-- Create a non-recursive Operator-pending mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function onoremap(lhs, rhs, ...) end

-- Create a non-recursive Insert mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function inoremap(lhs, rhs, ...) end

-- Create a non-recursive Insert, Command, and Lang-arg mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function lnoremap(lhs, rhs, ...) end

-- Create a non-recursive Command mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function cnoremap(lhs, rhs, ...) end

-- Create a non-recursive Terminal mode mapping
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  rhs   string       Right-hand side of map
-- @vararg opts  string|table Map options
-- @param  label string       Optional label for which-key.nvim
function tnoremap(lhs, rhs, ...) end

-- Specify a which-key group name for {lhs} in Normal, Visual, Select, and Operator-pending mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function name(lhs, name, ...) end

-- Specify a which-key group name for {lhs} in Normal mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function nname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} in Normal and Command mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function namebang(lhs, name, ...) end

-- Specify a which-key group name for {lhs} in Visual and Select mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function vname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} in Visual mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function xname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} in Select mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function sname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} inn Operator-pending mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function oname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} inn Insert mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function iname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} inn Insert, Command, and Lang-arg mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function lname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} in Command mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function cname(lhs, name, ...) end

-- Specify a which-key group name for {lhs} in Terminal mode
-- @param  lhs   string|table Left-hand side(s) of map
-- @param  name  string       Which-key name
-- @vararg opts  string|table Map options such as { buffer } or { filetype }.
function tname(lhs, name, ...) end
