/** @noSelf */
interface NoColonType {
  [key: string]: (arg?: any, ...args: any[]) => any;
}
declare function require<T>(this: void, modname: string): NoColonType & T;

declare function print(str: string): void;
