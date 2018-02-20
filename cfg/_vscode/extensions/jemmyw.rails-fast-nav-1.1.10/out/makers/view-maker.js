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
const rails_workspace_1 = require("../rails-workspace");
const path = require("path");
const fs = require("fs-extra");
function isPartial(filename) {
    return path.basename(filename).startsWith('_');
}
function viewFileTitle(filename) {
    return viewFileType(filename) + ' ' + path.basename(filename);
}
function viewFileType(filename) {
    return isPartial(filename) ? 'Partial' : 'View';
}
function viewMaker(railsFile, workspace) {
    return __awaiter(this, void 0, void 0, function* () {
        const viewPath = rails_workspace_1.getViewPath(workspace, railsFile);
        if (!(yield fs.pathExists(viewPath))) {
            return [];
        }
        const files = yield fs.readdir(viewPath);
        return files
            .sort(function (a, b) {
            if (a.startsWith('_') && !b.startsWith('_')) {
                return 1;
            }
            if (b.startsWith('_') && !a.startsWith('_')) {
                return 1;
            }
            const [aName, bName] = [a.split('.')[0], b.split('.')[0]];
            const [aMethod, bMethod] = [
                railsFile.methods.indexOf(aName) > -1,
                railsFile.methods.indexOf(bName) > -1,
            ];
            if (aMethod && !bMethod) {
                return -1;
            }
            if (bMethod && !aMethod) {
                return 1;
            }
            if (aName === railsFile.methodName) {
                return -1;
            }
            if (bName === railsFile.methodName) {
                return 1;
            }
            if (aName < bName) {
                return -1;
            }
            if (bName < aName) {
                return 1;
            }
            return 0;
        })
            .map(file => ({
            checkedExists: true,
            filename: path.join(viewPath, file),
            title: viewFileTitle(file),
            type: viewFileType(file),
        }));
    });
}
exports.viewMaker = viewMaker;
//# sourceMappingURL=view-maker.js.map