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
const inflected_1 = require("inflected");
const path = require("path");
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
function fixtureMaker(railsFile, workspace) {
    return __awaiter(this, void 0, void 0, function* () {
        const pluralName = inflected_1.pluralize(justName(railsFile));
        const hasSpecs = yield workspace.hasSpecs();
        const fixtureFilename = path.join(hasSpecs ? workspace.specPath : workspace.testPath, 'fixtures', pluralName + '.yml');
        return [
            {
                filename: fixtureFilename,
                title: 'Fixture ' + pluralName + '.yml',
                type: 'fixture',
            },
        ];
    });
}
exports.fixtureMaker = fixtureMaker;
//# sourceMappingURL=fixture-maker.js.map