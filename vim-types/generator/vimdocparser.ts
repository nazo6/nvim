import { SectionDataType } from "./types";

export const vimdocParser = (text: string) => {
  const sectionSplitMatcher = /^(=======================.*===)|(--------------------.*---)$/;
  let sectionStrings: string[][] = [];
  let currentSectionStrings: string[] = [];
  text.split(/\r\n|\n/).forEach((value) => {
    if (sectionSplitMatcher.test(value)) {
      sectionStrings.push(currentSectionStrings);
      currentSectionStrings = [];
      return;
    }
    currentSectionStrings.push(value);
  });
  sectionStrings.push(currentSectionStrings);

  const headerMatcher = /(?<lefttitle>.+?)\s+\*(?<righttitle>.+?)\*$/;
  const headerMatcherFunc: (str: string) => string[] | null = (str: string) => {
    const res = headerMatcher.exec(str);
    if (res) {
      if (res.groups) {
        if (res.groups["lefttitle"] && res.groups["righttitle"]) {
          return [res.groups["lefttitle"], res.groups["righttitle"]];
        }
      }
    }
    return null;
  };
  const data = sectionStrings.map((lines) => {
    let sectionData: SectionDataType = {
      leftTitle: "",
      rightTitle: "",
      description: "",
      data: [],
    };

    //Section info
    const sectionHeaderMatch = headerMatcherFunc(lines[0]);
    if (sectionHeaderMatch) {
      sectionData.rightTitle = sectionHeaderMatch[1] ?? "";
      sectionData.leftTitle = sectionHeaderMatch[0] ?? "";
    }
    //Section description
    let crrLine = 1;
    while (true) {
      if (!lines[crrLine]) {
        break;
      }
      if (headerMatcherFunc(lines[crrLine])) {
        crrLine--;
        break;
      }
      sectionData.description += lines[crrLine] + "\n";
      crrLine++;
    }
    sectionData.description = sectionData.description.trim();

    while (true) {
      if (lines[crrLine] === undefined) {
        break;
      }
      const match = headerMatcherFunc(lines[crrLine]);
      if (match) {
        let leftTitle = match[0];
        let rightTitle = match[1];
        if (leftTitle === " ") {
          //2行に分かれているとき
          crrLine++;
          leftTitle = lines[crrLine];
        }
        const functionMatcher = /.+?\((.*?)\)/;
        const propType =
          functionMatcher.test(leftTitle) || functionMatcher.test(rightTitle)
            ? "func"
            : "value";
        let propDescription = "";
        crrLine++;
        while (true) {
          if (!lines[crrLine]) {
            break;
          }
          if (headerMatcherFunc(lines[crrLine])) {
            crrLine--;
            break;
          }
          propDescription += lines[crrLine] + "\n";
          crrLine++;
        }
        propDescription = propDescription.trim();
        if (propType === "func") {
          const functionMatch = functionMatcher.exec(leftTitle);
          const paramsString =
            !functionMatch || functionMatch[1] === "" ? "" : functionMatch[1];
          sectionData.data.push({
            type: "func",
            name: rightTitle.endsWith("()")
              ? rightTitle.slice(0, -2)
              : rightTitle,
            description: propDescription,
            argsType: paramsString,
            returnType: "string",
          });
        } else {
          sectionData.data.push({
            type: "value",
            name: rightTitle,
            description: propDescription,
            valuetype: "any",
          });
        }
      }
      crrLine++;
    }
    return sectionData;
  });
  return data;
};
