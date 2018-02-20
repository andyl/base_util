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
const rails_context_1 = require("../rails-context");
const makers_1 = require("../makers");
const util_1 = require("./util");
const rails_workspace_1 = require("../rails-workspace");
function switchToTest() {
    return __awaiter(this, void 0, void 0, function* () {
        return rails_context_1.getRailsContext([makers_1.testMaker, makers_1.specMaker, makers_1.inverseTestMaker], function (railsFile, workspace, switchFiles) {
            return __awaiter(this, void 0, void 0, function* () {
                if (railsFile.isTest()) {
                    if (switchFiles.length > 0) {
                        return util_1.openFile(switchFiles[0].filename);
                    }
                }
                if (switchFiles.length === 0) {
                    const testFilePath = yield rails_workspace_1.getTestFile(railsFile, workspace);
                    return yield util_1.showCreateFile(testFilePath);
                }
                if (switchFiles.length === 1) {
                    return util_1.openFile(switchFiles[0].filename);
                }
                else {
                    return util_1.showPicker(railsFile.railsRoot, switchFiles);
                }
            });
        });
    });
}
exports.switchToTest = switchToTest;
//# sourceMappingURL=switch-to-test.js.map