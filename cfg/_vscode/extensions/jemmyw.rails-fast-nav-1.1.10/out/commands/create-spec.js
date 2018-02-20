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
function createSpec() {
    return __awaiter(this, void 0, void 0, function* () {
        return rails_context_1.getRailsContext(function (railsFile, workspace) {
            return __awaiter(this, void 0, void 0, function* () {
                if (railsFile.isTest()) {
                    return;
                }
                return yield path_utils_1.ensureDocument(rails_workspace_1.getSpecPath(railsFile, workspace));
            });
        });
    });
}
exports.createSpec = createSpec;
//# sourceMappingURL=create-spec.js.map