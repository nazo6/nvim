# nvim
My neovim config.

## Requirements
### null-ls
- stylua
- eslint
- prettier

## Memo
### Some null-ls formatters and linters do not work on Windows
This was due to `vim.fn.exepath` not returning the correct value because shell was set to `pwsh.exe`.
Setting shell back to default will fix it.

### ESLint error `Parsing error: Cannot read file '..../tsconfig.json'`

Add this
```typescript
module.exports = {
  // ...
  parserOptions: {
    project: "tsconfig.json",
    tsconfigRootDir: __dirname,
  },
  // ...
}
```
