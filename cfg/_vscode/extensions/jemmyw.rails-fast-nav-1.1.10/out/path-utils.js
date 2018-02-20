"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const path = require("path");
const fs = require("fs-extra");
const vscode = require("vscode");
/**
 * Given a path like '/path/to/something.ext' and an append string '_extra',
 * returns '/path/to/something_extra.ext'
 */
function appendWithoutExt(filename, append) {
    const ext = path.extname(filename);
    const basename = path.basename(filename, ext);
    return path.join(path.dirname(filename), basename + append + ext);
}
exports.appendWithoutExt = appendWithoutExt;
function ensureDocument(filename) {
    return __awaiter(this, void 0, void 0, function* () {
        yield fs.ensureFile(filename);
        const document = yield vscode.workspace.openTextDocument(filename);
        yield vscode.window.showTextDocument(document);
    });
}
exports.ensureDocument = ensureDocument;
//# sourceMappingURL=path-utils.js.map