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
const makers_1 = require("./makers");
function switchRule(matcher, maker) {
    return function (railsFile, workspace) {
        return __awaiter(this, void 0, void 0, function* () {
            if (yield matcher(railsFile, workspace)) {
                const files = yield maker(railsFile, workspace);
                if (Array.isArray(files)) {
                    return files;
                }
                else {
                    return [files];
                }
            }
            else {
                return [];
            }
        });
    };
}
exports.rules = [
    switchRule((f, w) => w.hasSpecs(), makers_1.specMaker),
    switchRule((f, w) => w.hasTests(), makers_1.testMaker),
    switchRule((f, w) => f.isTest(), makers_1.inverseTestMaker),
    switchRule(f => !f.isModel(), makers_1.modelMaker),
    switchRule(f => f.isController(), makers_1.viewMaker),
    switchRule(f => f.isModel() || f.isView(), makers_1.controllerMaker),
    switchRule(f => !f.isFixture(), makers_1.fixtureMaker),
];
//# sourceMappingURL=rules.js.map