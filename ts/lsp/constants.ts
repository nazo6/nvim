export const SERVERS = [
  'bashls',
  'clangd',
  'cssls',
  'denols',
  'dockerls',
  'diagnosticls',
  'eslintls',
  'gopls',
  'graphql',
  'html',
  'jsonls',
  'solargraph',
  'sumneko_lua',
  'texlab',
  'tsserver',
  'vimls',
  'vuels',
  'yamlls'
] as const;
export type ServerNamesType = typeof SERVERS[number];

/** @noSelf */
export interface ServerConfigType {
  name: string;
  installer: () => void;
  installChecker?: () => void;
  defaultOptions: any;
}
