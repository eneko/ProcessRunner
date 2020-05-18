**CLASS**

# `ProcessRunner`

```swift
public class ProcessRunner
```

> Process runner to execute system commands

## Properties
### `command`

```swift
public let command: String
```

### `arguments`

```swift
public let arguments: [String]
```

### `captureOutput`

```swift
public let captureOutput: Bool
```

### `currentDirectoryPath`

```swift
public let currentDirectoryPath: String?
```

## Methods
### `init(command:arguments:captureOutput:currentDirectoryPath:)`

```swift
public init(command: String, arguments: [String], captureOutput: Bool, currentDirectoryPath: String? = nil)
```

> Initialize process runner
> - Parameters:
>   - command: Absolute path to the binary executable
>   - arguments: List of arguments to pass to the executable
>   - captureOutput: Capture stdout and stderr
>   - currentDirectoryPath: Specify current directory for child process (optional)

#### Parameters

| Name | Description |
| ---- | ----------- |
| command | Absolute path to the binary executable |
| arguments | List of arguments to pass to the executable |
| captureOutput | Capture stdout and stderr |
| currentDirectoryPath | Specify current directory for child process (optional) |

### `run()`

```swift
public func run() throws -> ProcessResult
```

> Execute the process
> - Throws: Throws error if process fails to run
> - Returns: Process execution result, including status code and captured output
