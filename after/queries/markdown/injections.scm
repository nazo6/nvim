; extends
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "typescript"))
((inline) @injection.content
  (#lua-match? @injection.content "export")
  (#set! injection.language "typescript"))
((inline) @injection.content
  (#lua-match? @injection.content "<.+/>")
  (#set! injection.language "typescriptreact"))
((inline) @injection.content
  (#lua-match? @injection.content "<.->.-</.->")
  (#set! injection.language "typescriptreact"))
