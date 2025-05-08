# Riffy's Homebrew Taps

A collection of personalized Homebrew Taps. Add to your Homebrew by running:

```
brew tap rayriffy/taps
```

## netcoredbg

An open-source debugger for CoreCLR ([source](https://github.com/Samsung/netcoredbg)). This serves as an alternative to `vsdbg`, which is exclusive to VS Code and Visual Studio. This means `vsdbg` cannot be used in VS Code forks (such as Cursor).

```
brew install netcoredbg
```

The compilation process may take approximately 10-15 minutes. After completion, the debugger will be available at `/opt/homebrew/Cellar/netcoredbg/3.1.2/netcoredbg`. To use it, add the following configuration to the `launch.json` file in your project:

```json
"pipeTransport": {
  "pipeCwd": "${workspaceFolder}",
  "pipeProgram": "bash",
  "pipeArgs": ["-c"],
  "debuggerPath": "/opt/homebrew/Cellar/netcoredbg/3.1.2/netcoredbg",
  "debuggerArgs": ["--interpreter=vscode"],
  "quoteArgs": true
}
```

Now you can debug your .NET projects without proprietary restrictions.
