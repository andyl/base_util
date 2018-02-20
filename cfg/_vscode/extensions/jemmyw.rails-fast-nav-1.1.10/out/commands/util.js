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
const vscode = require("vscode");
const path = require("path");
const path_utils_1 = require("../path-utils");
function openFile(filename) {
    return vscode.workspace
        .openTextDocument(filename)
        .then(vscode.window.showTextDocument);
}
exports.openFile = openFile;
function createFile(switchFile) {
    return __awaiter(this, void 0, void 0, function* () {
        return openFile(switchFile.filename);
    });
}
exports.createFile = createFile;
function existingQuickPickItem(root) {
    return (switchFile, index) => ({
        label: switchFile.title,
        description: '',
        detail: path.relative(root, switchFile.filename),
        index,
        create: false,
    });
}
function createQuickPickItem(root) {
    return (switchFile, index) => ({
        label: switchFile.title,
        description: `Create ${switchFile.type}`,
        detail: path.relative(root, switchFile.filename),
        index,
        create: true,
    });
}
function quickPickItem(root) {
    const existing = existingQuickPickItem(root);
    const create = createQuickPickItem(root);
    return (switchFile, index) => {
        if (switchFile.checkedExists) {
            return existing(switchFile, index);
        }
        else {
            return create(switchFile, index);
        }
    };
}
function quickPickItems(root, switchFiles) {
    return __awaiter(this, void 0, void 0, function* () {
        return (yield Promise.resolve(switchFiles)).map(quickPickItem(root));
    });
}
function showPicker(root, switchFiles) {
    return __awaiter(this, void 0, void 0, function* () {
        const picked = yield vscode.window.showQuickPick(quickPickItems(root, switchFiles));
        if (picked) {
            const switchFile = switchFiles[picked.index];
            if (picked.create) {
                yield createFile(switchFile);
            }
            else {
                yield openFile(switchFile.filename);
            }
            return switchFile;
        }
    });
}
exports.showPicker = showPicker;
function showYesNo(message) {
    return __awaiter(this, void 0, void 0, function* () {
        const yesItem = {
            title: 'Yes',
        };
        const noItem = {
            title: 'No',
            isCloseAffordance: true,
        };
        const response = yield vscode.window.showInformationMessage(message, yesItem, noItem);
        return response === yesItem;
    });
}
exports.showYesNo = showYesNo;
function showCreateFile(filename) {
    return __awaiter(this, void 0, void 0, function* () {
        const root = vscode.workspace.workspaceFolders[0].uri.fsPath;
        const display = path.relative(root, filename);
        const message = `Create ${display}`;
        if (yield showYesNo(message)) {
            return path_utils_1.ensureDocument(filename);
        }
    });
}
exports.showCreateFile = showCreateFile;
//# sourceMappingURL=util.js.map