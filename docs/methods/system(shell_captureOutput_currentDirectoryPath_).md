### `system(shell:captureOutput:currentDirectoryPath:)`

```swift
public func system(shell: String, captureOutput: Bool = false,
                   currentDirectoryPath: String? = nil) throws -> ProcessResult
```

> Executes command with parameters in a subshell
>
> `system` will wait for the shell process to finish, blocking the current thread.
>
> - Parameters:
>   - shell: Shell command with parameters to execute in a subshell with `sh -c`.
>   - captureOutput: If output is captured, both stdout and strerr will be available in
>                    the return object. Otherwise, process output will be forwarded to stdout and stderr.
>                    Defaults to `false`.
>   - currentDirectoryPath: Specify current directory for child process (optional)
> - Returns: Process result data which is available after process termination.
>   The `ProcessResult` object includes exit code or termination signal and any captured output.
> - Throws: `SystemError.waitpid` if process execution failed.

#### Parameters

| Name | Description |
| ---- | ----------- |
| shell | Shell command with parameters to execute in a subshell with `sh -c`. |
| captureOutput | If output is captured, both stdout and strerr will be available in the return object. Otherwise, process output will be forwarded to stdout and stderr. Defaults to `false`. |
| currentDirectoryPath | Specify current directory for child process (optional) |