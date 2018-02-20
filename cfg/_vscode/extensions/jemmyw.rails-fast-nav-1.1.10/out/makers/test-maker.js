"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const rails_workspace_1 = require("../rails-workspace");
const path_utils_1 = require("../path-utils");
const path = require("path");
function testMaker(railsFile, workspace) {
    return [{
            filename: path.join(workspace.testPath, path_utils_1.appendWithoutExt(rails_workspace_1.relativeToAppDir(workspace, railsFile.filename), '_test')),
            title: 'Test file',
            type: 'test',
        }];
}
exports.testMaker = testMaker;
//# sourceMappingURL=test-maker.js.map