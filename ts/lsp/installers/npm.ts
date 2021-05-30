import { executeShell } from "./term";

export const npm = (packageName: string, installPath: string) => {
  vim.fn.mkdir(installPath, "p")
  executeShell(`npm install ${packageName}`, installPath);
};
