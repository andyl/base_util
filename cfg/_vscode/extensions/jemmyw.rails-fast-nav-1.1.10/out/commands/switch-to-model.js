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
const rails_file_1 = require("../rails-file");
const makers_1 = require("../makers");
const switches_1 = require("../switches");
const util_1 = require("./util");
function switchToModel() {
    return __awaiter(this, void 0, void 0, function* () {
        const railsFile = rails_file_1.getCurrentRailsFile();
        if (!railsFile) {
            return;
        }
        if (railsFile.isModel()) {
            return;
        }
        const switchFiles = yield switches_1.getSwitchesFromRule(makers_1.modelMaker, railsFile);
        if (switchFiles.length === 0) {
            return yield vscode.window.showInformationMessage('No model found for this file');
        }
        if (switchFiles.length === 1) {
            return util_1.openFile(switchFiles[0].filename);
        }
        else {
            return util_1.showPicker(railsFile.railsRoot, switchFiles);
        }
    });
}
exports.switchToModel = switchToModel;
//# sourceMappingURL=switch-to-model.js.map