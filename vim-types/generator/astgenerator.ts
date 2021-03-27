import * as ts from "typescript";
import { SectionDataType } from "./types";
const factory = ts.factory;

export const astgenerator = (section: SectionDataType) => {
  return factory.createModuleDeclaration(
    undefined,
    [factory.createModifier(ts.SyntaxKind.DeclareKeyword)],
    factory.createIdentifier("vim"),
    factory.createModuleBlock(
      section.data.map((property) => {
        factory.createJSDocComment;
        if (property.type === "func") {
          factory.createJSDocAllType;
          const fn = factory.createFunctionDeclaration(
            undefined,
            undefined,
            undefined,
            factory.createIdentifier(property.name.slice(4)),
            undefined,
            [],
            factory.createFunctionTypeNode(
              undefined,
              property.argsType.map((arg) => {
                return factory.createParameterDeclaration(
                  undefined,
                  undefined,
                  undefined,
                  factory.createIdentifier(arg.name),
                  undefined,
                  factory.createKeywordTypeNode(ts.SyntaxKind.AnyKeyword),
                  undefined
                );
              }),
              factory.createKeywordTypeNode(ts.SyntaxKind.AnyKeyword)
            ),
            undefined
          );
          return fn;
        } else {
          const variable = factory.createVariableStatement(
            undefined,
            factory.createVariableDeclarationList(
              [
                factory.createVariableDeclaration(
                  factory.createIdentifier(property.name),
                  undefined,
                  factory.createKeywordTypeNode(ts.SyntaxKind.AnyKeyword),
                  undefined
                ),
              ],
              ts.NodeFlags.Const
            )
          );
          const jsdoc = factory.createJSDocComment(property.description);
          return variable;
        }
      })
    ),
    ts.NodeFlags.Namespace | ts.NodeFlags.ContextFlags
  );
};
