**STRUCT**

# `ProcessResult`

```swift
public struct ProcessResult
```

> Process result, including captured output if required

## Properties
### `exitStatus`

```swift
public let exitStatus: Int
```

> Process exit status code

### `standardOutput`

```swift
public let standardOutput: String
```

> Standard output, if captured

### `standardError`

```swift
public let standardError: String
```

> Standard error output, if captured

### `success`

```swift
public var success: Bool
```

> Returns `true` if the process finalized with exit code 0.
