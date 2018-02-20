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
const rails_context_1 = require("../rails-context");
const switches_1 = require("../switches");
const makers_1 = require("../makers");
const util_1 = require("./util");
function switchToFixture() {
    return __awaiter(this, void 0, void 0, function* () {
        return rails_context_1.getRailsContext(function (railsFile, workspace) {
            return __awaiter(this, void 0, void 0, function* () {
                const switchFiles = yield switches_1.getSwitchesFromRules([makers_1.fixtureMaker], railsFile, false);
                const checked = yield switches_1.checkSwitchFiles(switchFiles);
                switch (checked.length) {
                    case 0: {
                        if (switchFiles.length === 0) {
                            return yield vscode.window.showInformationMessage('No fixture found for this file');
                        }
                        else {
                            return yield util_1.showCreateFile(switchFiles[0].filename);
                        }
                    }
                    case 1: {
                        return util_1.openFile(switchFiles[0].filename);
                    }
                    default: {
                        return util_1.showPicker(railsFile.railsRoot, switchFiles);
                    }
                }
            });
        });
    });
}
exports.switchToFixture = switchToFixture;
//# sourceMappingURL=switch-to-fixture.js.map