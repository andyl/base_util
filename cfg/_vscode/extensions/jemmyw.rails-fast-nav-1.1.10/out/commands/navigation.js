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
const switches_1 = require("../switches");
const rails_file_1 = require("../rails-file");
const util_1 = require("./util");
function navigateRails() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const railsFile = rails_file_1.getCurrentRailsFile();
            if (!railsFile) {
                return;
            }
            const switchableFiles = yield switches_1.getCheckedSwitches(railsFile);
            return yield util_1.showPicker(railsFile.railsRoot, switchableFiles);
        }
        catch (err) {
            console.error(err);
        }
    });
}
exports.navigateRails = navigateRails;
//# sourceMappingURL=navigation.js.map