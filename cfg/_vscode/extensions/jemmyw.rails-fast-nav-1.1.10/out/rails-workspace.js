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
const fs = require("fs-extra");
const path = require("path");
const vscode = require("vscode");
const path_utils_1 = require("./path-utils");
/**
 * Some information about a Rails application at a given path.
 *
 * @export
 * @class RailsWorkspace
 */
class RailsWorkspace {
    constructor(_path) {
        this._path = _path;
        this._knownFiles = {};
    }
    get path() {
        return this._path;
    }
    get appPath() {
        const appDir = vscode.workspace.getConfiguration('rails').appDir || 'app';
        console.log(appDir);
        return path.resolve(this.path, appDir);
    }
    get specPath() {
        return path.join(this.path, 'spec');
    }
    get testPath() {
        return path.join(this.path, 'tests');
    }
    get controllersPath() {
        return path.join(this.appPath, 'controllers');
    }
    get modelsPath() {
        return path.join(this.appPath, 'models');
    }
    get viewsPath() {
        return path.join(this.appPath, 'views');
    }
    hasSpecs() {
        return __awaiter(this, void 0, void 0, function* () {
            return this.hasFile(this.specPath);
        });
    }
    hasTests() {
        return __awaiter(this, void 0, void 0, function* () {
            return this.hasFile(this.testPath);
        });
    }
    hasFile(path) {
        return __awaiter(this, void 0, void 0, function* () {
            if (this._knownFiles[path]) {
                return true;
            }
            if (!path.startsWith(this.path)) {
                return false;
            }
            const exists = yield fs.pathExists(path);
            if (exists) {
                this._knownFiles[path] = true;
            }
            return exists;
        });
    }
    pathIn(filePath) {
        return filePath.startsWith(this.path);
    }
}
exports.RailsWorkspace = RailsWorkspace;
const cache = {};
/**
 * A cache of rails workspaces.
 *
 * @example
 *
 *   const workspace = await RailsWorkspaceCache.fetch('/path/to/workspace');
 */
exports.RailsWorkspaceCache = {
    fetch(path) {
        return __awaiter(this, void 0, void 0, function* () {
            if (cache[path]) {
                return cache[path];
            }
            cache[path] = new RailsWorkspace(path);
            return cache[path];
        });
    },
};
/**
 * Given a rails file, return it's location in the app/* directory of the
 * workspace.
 *
 * This is useful for deriving the location of related files. For example,
 * 'app/models/subdir/model.rb', will translate to 'subdir/model.rb', and if
 * we're looking for a spec that becomes 'spec/subdir/model_spec.rb'`
 */
function locationWithinAppLocation(filename, workspace) {
    return path
        .dirname(relativeToAppDir(workspace, filename))
        .split(path.sep)
        .slice(1)
        .join(path.sep);
}
exports.locationWithinAppLocation = locationWithinAppLocation;
function relativeToRootDir(workspace, filename) {
    if (!filename) {
        return filename => relativeToRootDir(workspace, filename);
    }
    return path.relative(workspace.path, filename);
}
exports.relativeToRootDir = relativeToRootDir;
function relativeToAppDir(workspace, filename) {
    if (!filename) {
        return filename => relativeToAppDir(workspace, filename);
    }
    return path.relative(workspace.appPath, filename);
}
exports.relativeToAppDir = relativeToAppDir;
function getTestFile(railsFile, workspace) {
    return __awaiter(this, void 0, void 0, function* () {
        const specs = yield workspace.hasSpecs();
        const fn = specs ? getSpecPath : getTestPath;
        return fn(railsFile, workspace);
    });
}
exports.getTestFile = getTestFile;
function getTestPath(railsFile, workspace) {
    const relFn = (railsFile.inApp ? relativeToAppDir : relativeToRootDir)(workspace);
    return path.join(workspace.specPath, path_utils_1.appendWithoutExt(relFn(railsFile.filename), '_spec'));
}
exports.getTestPath = getTestPath;
function getSpecPath(railsFile, workspace) {
    const relFn = (railsFile.inApp ? relativeToAppDir : relativeToRootDir)(workspace);
    return path.join(workspace.specPath, path_utils_1.appendWithoutExt(relFn(railsFile.filename), '_spec'));
}
exports.getSpecPath = getSpecPath;
/**
 * Get the view path of a controller
 */
function getViewPath(workspace, railsFile) {
    const justName = railsFile.basename
        .split('_')
        .slice(0, -1)
        .join('_');
    return path.join(workspace.viewsPath, locationWithinAppLocation(railsFile.filename, workspace), justName);
}
exports.getViewPath = getViewPath;
//# sourceMappingURL=rails-workspace.js.map