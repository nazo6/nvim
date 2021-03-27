export type PropertyDataType =
  | {
      type: "func";
      name: string;
      description: string;
      argsType: string;
      returnType: "string";
    }
  | {
      type: "value";
      name: string;
      description: string;
      valuetype: "any";
    };
export type SectionDataType = {
  leftTitle: string;
  rightTitle: string;
  description: string;
  data: PropertyDataType[];
};
