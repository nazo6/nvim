# nvim
My neovim config.

## Dependencies
- stylua

## Memo
### ESLint
- eslint error `Parsing error: Cannot read file '..../tsconfig.json'`

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
