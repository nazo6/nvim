import { promises as fs } from "fs";
import { vimdocParser } from "./vimdocparser";
const readSource = async (fileName: string) => {
  return await fs.readFile(`${__dirname}/../sources/${fileName}.txt`, {
    encoding: "utf-8",
  });
};
const writeOutput = async (filePath: string, data: string) => {
  await fs.writeFile(`${__dirname}/output/${filePath}`, data);
};

const processLuaDoc = async () => {
  const validSections = ["lua-vim", "lua-uri"];
  const data = vimdocParser(await readSource("lua.txt"));
  data.forEach((section) => {
    if (section.rightTitle in validSections) {
    }
  });
};

const main = async () => {
  await processLuaDoc();
};

main();
