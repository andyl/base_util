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
const rails_context_1 = require("../rails-context");
const makers_1 = require("../makers");
const switches_1 = require("../switches");
const util_1 = require("./util");
const create_view_1 = require("./create-view");
function isCurrentMethodView(methodName, filename) {
    const viewName = path.basename(filename).split('.')[0];
    return viewName === methodName;
}
function switchToView() {
    return rails_context_1.getRailsContext(function (railsFile, workspace) {
        return __awaiter(this, void 0, void 0, function* () {
            if (!railsFile.isController()) {
                return;
            }
            const switchFiles = yield switches_1.getSwitchesFromRule(makers_1.viewMaker, railsFile);
            if (switchFiles.length === 0) {
                return yield create_view_1.createView();
            }
            if (switchFiles.length === 1 ||
                isCurrentMethodView(railsFile.methodName, switchFiles[0].filename)) {
                return util_1.openFile(switchFiles[0].filename);
            }
            else {
                return util_1.showPicker(railsFile.railsRoot, switchFiles);
            }
        });
    });
}
exports.switchToView = switchToView;
//# sourceMappingURL=switch-to-view.js.map