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
const rails_workspace_1 = require("./rails-workspace");
const fs = require("fs-extra");
const rules_1 = require("./rules");
function existsFilter(switchFile) {
    return Boolean(switchFile.checkedExists);
}
/**
 * Given a list of switch files, return the ones that exist on the filesystem
 */
function checkSwitchFiles(switchFiles) {
    return __awaiter(this, void 0, void 0, function* () {
        return (yield Promise.all((yield Promise.resolve(switchFiles)).map(checkSwitchFile))).filter(existsFilter);
    });
}
exports.checkSwitchFiles = checkSwitchFiles;
function getSwitchesFromRule(rule, railsFile) {
    const fn = function (railsFile) {
        return __awaiter(this, void 0, void 0, function* () {
            const workspace = yield rails_workspace_1.RailsWorkspaceCache.fetch(railsFile.railsRoot);
            const switchFiles = rule(railsFile, workspace);
            return checkSwitchFiles(switchFiles);
        });
    };
    if (railsFile) {
        return fn(railsFile);
    }
    return fn;
}
exports.getSwitchesFromRule = getSwitchesFromRule;
function getSwitchesFromRules(rules, railsFile, checked = true) {
    return __awaiter(this, void 0, void 0, function* () {
        const workspace = yield rails_workspace_1.RailsWorkspaceCache.fetch(railsFile.railsRoot);
        const switchFiles = Promise.all(rules.map(rule => rule(railsFile, workspace))).then(switches => [].concat(...switches));
        return checked ? checkSwitchFiles(switchFiles) : switchFiles;
    });
}
exports.getSwitchesFromRules = getSwitchesFromRules;
/**
 * Check to see if a switch file exists. If it has already been checked return
 * true, otherwise look to the filesystem.
 */
function switchFileExists(switchFile) {
    return __awaiter(this, void 0, void 0, function* () {
        return switchFile.checkedExists || fs.pathExists(switchFile.filename);
    });
}
/**
 * Check to see if a switch file exists and return the switch file with
 * `checkedExists` filled in.
 */
function checkSwitchFile(switchFile) {
    return __awaiter(this, void 0, void 0, function* () {
        const resolvedSwitchFile = yield Promise.resolve(switchFile);
        return Object.assign({}, resolvedSwitchFile, { checkedExists: yield switchFileExists(resolvedSwitchFile) });
    });
}
/**
 * Return all available switch files using the preset rules.
 */
function getCheckedSwitches(railsFile) {
    return __awaiter(this, void 0, void 0, function* () {
        return yield getSwitchesFromRules(rules_1.rules, railsFile);
    });
}
exports.getCheckedSwitches = getCheckedSwitches;
//# sourceMappingURL=switches.js.map