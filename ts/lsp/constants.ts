export const SERVERS = [
  'cssls',
  'denols',
  'diagnosticls',
  'html',
  'jsonls',
  'sumneko_lua',
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
