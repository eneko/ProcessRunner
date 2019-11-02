### `system(command:parameters:captureOutput:)`

```swift
public func system(command: String, parameters: [String], captureOutput: Bool = false) throws -> ProcessResult
```

> Executes command with parameters as a child process
>
> `system` will wait for the process to finish, blocking the current thread.
>
> - Parameters:
>   - command: Command to execute.
>   - parameters: List of parameters to pass to the command.
>   - captureOutput: If output is captured, both stdout and strerr will be available in
>     the return object. Otherwise, process output will be forwarded to stdout and stderr.
> - Returns: Process result data which is available after process termination.
>   The `ProcessResult` object includes exit code or termination signal and any captured output.
> - Throws: `SystemError.waitpid` if process execution failed.

#### Parameters

| Name | Description |
| ---- | ----------- |
| command | Command to execute. |
| parameters | List of parameters to pass to the command. |
| captureOutput | If output is captured, both stdout and strerr will be available in the return object. Otherwise, process output will be forwarded to stdout and stderr. |