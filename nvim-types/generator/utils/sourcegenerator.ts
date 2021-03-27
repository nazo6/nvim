export const createDeclareNamespace = (name: string, content: string) => {
  return `declare namespace ${name} {
    ${content}
  }`;
};
export const createConstant = (name: string, type: string) => {
  return `const ${name}: ${type};` + "\n";
};
export const createVariable = (name: string, type: string) => {
  return `let ${name}: ${type};` + "\n";
};
export const createFunction = (
  name: string,
  argsType: string,
  returnType: string
) => {
  return `function ${name}: (${argsType}) => ${returnType}` + "\n";
};

export const createInterface = (name: string, content: string) => {
  return `interface ${name} {
    ${content}
  }`;
};
export const createIVariable = (name: string, type: string) => {
  return `${name}: ${type},` + "\n";
};
export const createIFunction = (
  name: string,
  argsType: string,
  returnType: string
) => {
  return `${name}: (${argsType}) => ${returnType},` + "\n";
};
