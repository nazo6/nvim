import { promises as fs } from "fs";
import { vimdocParser } from "./vimdocparser";
import * as path from "path";

const readSource = async (fileName: string) => {
  return await fs.readFile(`${__dirname}/../sources/${fileName}`, {
    encoding: "utf-8",
  });
};
const writeOutput = async (
  filePath: string,
  fileName: string,
  data: string
) => {
  await fs.writeFile(
    path.join(__dirname, "../output", filePath, fileName),
    data
  );
};

const generateJson = async (fileName: string, validSections: string[]) => {
  const data = vimdocParser(await readSource(fileName));
  data.forEach(async (section) => {
    console.log(section.rightTitle);
    if (validSections.includes(section.rightTitle)) {
      try {
        await writeOutput(
          `json/doc/${fileName}/`,
          `${section.rightTitle}.json`,
          JSON.stringify(section, null, " ")
        );
      } catch {
        await writeOutput(
          `json/doc/${fileName}/`,
          `${section.leftTitle}.json`,
          JSON.stringify(section, null, " ")
        );
      }
    }
  });
};

const main = async () => {
  await generateJson("lua.txt", [
    "lua-regex",
    "lua-builtin",
    "lua-vimscript",
    "lua-vim",
    "lua-uri",
    "lua-highlight",
  ]);
  await generateJson("eval.txt", [
    "internal-variables* *E461",
    "vim-function* *functions",
  ]);
  await generateJson("api.txt", [
    "api-global-events",
    "api-buffer-updates",
    "api-global",
    "api-buffer",
    "api-window",
    "api-tabpage",
    "api-ui",
  ]);
};

main();
