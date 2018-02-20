"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const path = require("path");
function inTestDir(workspace, filename) {
    return !path.relative(workspace.testPath, filename).startsWith('..');
}
function inSpecDir(workspace, filename) {
    return !path.relative(workspace.specPath, filename).startsWith('..');
}
function relativeToTestDir(workspace, filename) {
    if (inTestDir(workspace, filename)) {
        return path.relative(workspace.testPath, filename);
    }
    else if (inSpecDir(workspace, filename)) {
        return path.relative(workspace.specPath, filename);
    }
}
function inverseTestMaker(railsFile, workspace) {
    if (!railsFile.isTest()) {
        return [];
    }
    const basename = railsFile.basename.replace(/_(spec|test)/, '');
    const relativeFilename = relativeToTestDir(workspace, railsFile.filename);
    if (!relativeFilename) {
        return [];
    }
    const relativePath = path.dirname(relativeFilename);
    return [
        {
            filename: path.join(workspace.appPath, relativePath, basename),
            title: 'File',
            type: 'file',
        },
        {
            filename: path.join(workspace.path, relativePath, basename),
            title: 'File',
            type: 'file',
        },
    ];
}
exports.inverseTestMaker = inverseTestMaker;
//# sourceMappingURL=inverse-test-maker.js.map