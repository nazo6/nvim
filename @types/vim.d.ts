declare namespace vim {
  /**
   * Vim global variables.
   */
  const g: {
    mapleader: string;
    [key: string]: any;
  };
  const b: any;
  const w: any;
  const t: any;
  function cmd(cmd: string): void;
  const fn: AnyInterface;
  const api: AnyInterface;
}

declare interface AnyInterface {
  [key: string]: (this: void, ...args: any[]) => any;
}
