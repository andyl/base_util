"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const rails_workspace_1 = require("../rails-workspace");
const path_utils_1 = require("../path-utils");
const path = require("path");
function specMaker(railsFile, workspace) {
    return [
        {
            filename: path.join(workspace.specPath, path_utils_1.appendWithoutExt(rails_workspace_1.relativeToAppDir(workspace, railsFile.filename), '_spec')),
            title: 'Spec file',
            type: 'spec',
        },
    ];
}
exports.specMaker = specMaker;
//# sourceMappingURL=spec-maker.js.map