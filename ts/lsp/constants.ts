export const SERVERS = [
  'bashls',
  'cssls',
  'diagnosticls',
  'html',
  'jsonls',
  'sumneko_lua',
  'svelte',
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
