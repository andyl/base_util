'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const commands_1 = require("./commands");
function activate(context) {
    Object.keys(commands_1.commands).forEach(name => {
        const command = commands_1.commands[name];
        const disposable = vscode.commands.registerCommand(`rails.${name}`, command);
        context.subscriptions.push(disposable);
    });
}
exports.activate = activate;
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map