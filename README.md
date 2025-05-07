Riffy's Homebrew Taps
===

Collection of personalized Homebrew Taps. Add into your brew by running

```
brew tap rayriffy/taps
```

netcoredbg
---

Open-source debugger for CoreCLR ([source](https://github.com/Samsung/netcoredbg)). This is used as an alternative to `vsdbg` which is exclusive to VS Code, and Visual Studio. Meaning `vsdbg` will be unusable in VS Code forks (i.e. Cursor).

```
brew install netcoredbg
```

This process might take some time (~10-15 min) to compile, but after completion it will be available at `/opt/homebrew/Cellar/netcoredbg/3.1.2/netcoredbg`. Then in `launch.json` in your project, add additional config to tell IDE which debugger to use.

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

Enjoy debugging without DRM
