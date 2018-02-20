"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const defReg = /def\s+(\w+)/g;
/**
 * Given a document and a line, walk up the document to find a method definiton.
 * We assume that's the method we're in.
 */
function getLastMethodName(document, line) {
    for (let i = line; i >= 0; i--) {
        const line = document.lineAt(i);
        const matches = defReg.exec(line.text);
        if (matches) {
            return matches[1];
        }
    }
}
exports.getLastMethodName = getLastMethodName;
/**
 * Find all methods names in the document. This is a simple regex search, so it
 * returns everything matching 'def ...'
 */
function getAllMethodNames(document) {
    const text = document.getText();
    const names = [];
    let match;
    while ((match = defReg.exec(text))) {
        names.push(match[1]);
    }
    return names;
}
exports.getAllMethodNames = getAllMethodNames;
//# sourceMappingURL=ruby-methods.js.map