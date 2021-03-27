import { promises as fs } from "fs";
import * as path from "path";

export const readSource = async (fileName: string) => {
  return await fs.readFile(`${__dirname}/../sources/${fileName}`, {
    encoding: "utf-8",
  });
};
export const readJson = async (filePath: string) => {
  return await fs.readFile(`${__dirname}/../json/${filePath}`, {
    encoding: "utf-8",
  });
};
export const writeOutput = async (
  filePath: string,
  fileName: string,
  data: string
) => {
  await fs.writeFile(path.join(__dirname, "../", filePath, fileName), data);
};
