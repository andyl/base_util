"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const rails_file_1 = require("./rails-file");
const rails_workspace_1 = require("./rails-workspace");
const switches_1 = require("./switches");
function getRailsContext(...args) {
    let callback;
    let rules;
    if (args.length === 2) {
        rules = args[0];
        callback = args[1];
    }
    else if (args.length === 1 && Array.isArray(args[0])) {
        rules = args[0];
    }
    else if (args.length === 1) {
        callback = args[0];
    }
    const railsFile = rails_file_1.getCurrentRailsFile();
    const workspacePromise = rails_workspace_1.RailsWorkspaceCache.fetch(railsFile.railsRoot);
    const switchCallback = (railsFile, workspace) => {
        if (rules) {
            return switches_1.getSwitchesFromRules(rules, railsFile).then(switchFiles => callback(railsFile, workspace, switchFiles));
        }
        else {
            return callback(railsFile, workspace);
        }
    };
    if (callback) {
        return workspacePromise.then(workspace => switchCallback(railsFile, workspace));
    }
    else {
        return workspacePromise.then(workspace => {
            return {
                railsFile,
                workspace,
                in: function (callback) {
                    if (railsFile) {
                        return switchCallback(railsFile, workspace);
                    }
                    else {
                        return Promise.resolve();
                    }
                },
            };
        });
    }
}
exports.getRailsContext = getRailsContext;
//# sourceMappingURL=rails-context.js.map