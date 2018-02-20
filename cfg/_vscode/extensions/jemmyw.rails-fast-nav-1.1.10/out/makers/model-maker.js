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
const inflected_1 = require("inflected");
const fs = require("fs-extra");
const path = require("path");
function insideDir(root, filename) {
    return !path.relative(root, filename).startsWith('..');
}
function justName(railsFile) {
    if (railsFile.isView()) {
        return path.basename(railsFile.dirname);
    }
    else {
        return railsFile.basename
            .split('_')
            .slice(0, railsFile.isTest() ? -2 : -1)
            .join('_');
    }
}
function modelMaker(railsFile, workspace) {
    return __awaiter(this, void 0, void 0, function* () {
        const singularName = inflected_1.singularize(justName(railsFile));
        let location = path.join(workspace.modelsPath, rails_workspace_1.locationWithinAppLocation(railsFile.filename, workspace));
        while (insideDir(workspace.modelsPath, location)) {
            const modelPath = path.join(location, singularName + '.rb');
            console.log(modelPath);
            if (yield fs.pathExists(modelPath)) {
                return [
                    {
                        filename: modelPath,
                        title: 'Model ' + path.basename(modelPath),
                        type: 'model',
                        checkedExists: true,
                    },
                ];
            }
            location = path.dirname(location);
        }
        return [];
    });
}
exports.modelMaker = modelMaker;
//# sourceMappingURL=model-maker.js.map