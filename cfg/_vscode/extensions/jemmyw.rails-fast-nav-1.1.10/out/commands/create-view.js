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
const rails_context_1 = require("../rails-context");
const path_utils_1 = require("../path-utils");
const vscode = require("vscode");
const path = require("path");
function createView() {
    return __awaiter(this, void 0, void 0, function* () {
        return rails_context_1.getRailsContext(function (railsFile, workspace) {
            return __awaiter(this, void 0, void 0, function* () {
                if (!railsFile.isController()) {
                    return;
                }
                const value = railsFile.methodName && railsFile.methodName.length > 0
                    ? `${railsFile.methodName}.html.erb`
                    : '';
                const viewName = yield vscode.window.showInputBox({
                    value,
                    prompt: `Create view for controller ${railsFile.classname}`,
                    placeHolder: 'index.html.erb',
                });
                if (!viewName || viewName === '') {
                    return;
                }
                const viewPath = rails_workspace_1.getViewPath(workspace, railsFile);
                const viewFile = path.join(viewPath, viewName);
                return yield path_utils_1.ensureDocument(viewFile);
            });
        });
    });
}
exports.createView = createView;
//# sourceMappingURL=create-view.js.map