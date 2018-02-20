"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const path = require("path");
const fs = require("fs-extra");
const vscode = require("vscode");
const ruby_methods_1 = require("./ruby-methods");
const inflected_1 = require("inflected");
function isRailsRoot(filename) {
    const railsBin = path.join(filename, 'bin', 'rails');
    const railsScript = path.join(filename, 'script', 'rails');
    return fs.existsSync(railsBin) || fs.existsSync(railsScript);
}
function getRailsRoot(filename) {
    const dir = path.dirname(filename);
    if (isRailsRoot(dir)) {
        return dir;
    }
    else {
        return getRailsRoot(dir);
    }
}
/**
 * Information about the file that is currently open in the editor.
 */
class RailsFile {
    constructor(_filename, _methodName, _methods) {
        this._filename = _filename;
        this._methodName = _methodName;
        this._methods = _methods;
        this._parsed = path.parse(this._filename);
        this._railsRoot = getRailsRoot(this._parsed.dir);
        this._inApp = path
            .relative(this._railsRoot, _filename)
            .startsWith('app' + path.sep);
    }
    get classname() {
        return inflected_1.classify(path.basename(this._filename, this._parsed.ext));
    }
    get filename() {
        return this._filename;
    }
    get dirname() {
        return this._parsed.dir;
    }
    get basename() {
        return this._parsed.base;
    }
    get ext() {
        return this._parsed.ext;
    }
    get inApp() {
        return this._inApp;
    }
    get railsRoot() {
        return this._railsRoot;
    }
    get fileType() {
        if (!this._inApp) {
            if (this._parsed.name.endsWith('_spec')) {
                return 'spec';
            }
            if (this._parsed.name.endsWith('_test')) {
                return 'test';
            }
            if (this.dirname.endsWith('fixtures')) {
                return 'fixture';
            }
            if (this._parsed.ext === '.rb') {
                return 'unknown_ruby';
            }
            if (this._parsed.ext === '.erb') {
                return 'unknown_erb';
            }
            return 'unknown';
        }
        const rel = path.relative(path.join(this._railsRoot, 'app'), this._filename);
        return rel.split(path.sep)[0];
    }
    get methodName() {
        return this._methodName;
    }
    get methods() {
        return this._methods;
    }
    isInAppDir(dir) {
        return this.fileType === dir;
    }
    isController() {
        return this.isInAppDir('controllers');
    }
    isModel() {
        return this.isInAppDir('models');
    }
    isView() {
        return this.isInAppDir('views');
    }
    isTest() {
        return this.fileType === 'spec' || this.fileType === 'test';
    }
    isFixture() {
        return this.fileType === 'fixture';
    }
}
exports.RailsFile = RailsFile;
/**
 * Turn the current active editor into a RailsFile instance
 */
function getCurrentRailsFile() {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
        return null;
    }
    const activeSelection = editor.selection.active;
    const filename = editor.document.fileName;
    return new RailsFile(filename, ruby_methods_1.getLastMethodName(editor.document, activeSelection.line), ruby_methods_1.getAllMethodNames(editor.document));
}
exports.getCurrentRailsFile = getCurrentRailsFile;
//# sourceMappingURL=rails-file.js.map