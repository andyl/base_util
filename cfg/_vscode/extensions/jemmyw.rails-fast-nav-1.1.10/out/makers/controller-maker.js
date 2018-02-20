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
const path = require("path");
function getControllerNameFromView(railsFile, workspace) {
    const location = rails_workspace_1.locationWithinAppLocation(path.dirname(railsFile.filename), workspace);
    const controllerName = path.basename(path.dirname(railsFile.filename)) + '_controller.rb';
    return path.join(location, controllerName);
}
function getControllerNameFromModel(railsFile) {
    return (inflected_1.pluralize(path.basename(railsFile.filename, path.extname(railsFile.filename))) + '_controller.rb');
}
function getControllerName(railsFile, workspace) {
    if (railsFile.isView()) {
        return getControllerNameFromView(railsFile, workspace);
    }
    else {
        return getControllerNameFromModel(railsFile);
    }
}
function controllerMaker(railsFile, workspace) {
    return __awaiter(this, void 0, void 0, function* () {
        const controllerName = getControllerName(railsFile, workspace);
        if (controllerName) {
            return [
                {
                    checkedExists: false,
                    filename: path.join(workspace.controllersPath, controllerName),
                    title: 'Controller ' + controllerName,
                    type: 'controller',
                },
            ];
        }
        return [];
    });
}
exports.controllerMaker = controllerMaker;
//# sourceMappingURL=controller-maker.js.map