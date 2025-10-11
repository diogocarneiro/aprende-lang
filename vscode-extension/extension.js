const vscode = require('vscode');

function activate(context) {
    const definitionProvider = vscode.languages.registerDefinitionProvider('aprende', {
        provideDefinition(document, position) {
            const wordRange = document.getWordRangeAtPosition(position, /[A-Za-z_][\w]*/);
            if (!wordRange) {
                return undefined;
            }

            const word = document.getText(wordRange);
            if (!word) {
                return undefined;
            }

            const definitions = findFunctionDefinitions(document, word);
            if (definitions.length === 0) {
                return undefined;
            }

            return definitions;
        }
    });

    context.subscriptions.push(definitionProvider);
}

function findFunctionDefinitions(document, functionName) {
    const results = [];
    const definitionPattern = new RegExp(`^\\s*funcao\\s+${escapeRegex(functionName)}\\s*(\\(|$)`, 'i');

    for (let line = 0; line < document.lineCount; line++) {
        const text = document.lineAt(line).text;
        if (definitionPattern.test(text)) {
            const index = text.toLowerCase().indexOf('funcao');
            if (index >= 0) {
                const position = new vscode.Position(line, index);
                results.push(new vscode.Location(document.uri, position));
            }
        }
    }

    return results;
}

function escapeRegex(text) {
    return text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function deactivate() {}

module.exports = {
    activate,
    deactivate
};
