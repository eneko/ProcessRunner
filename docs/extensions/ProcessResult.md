**EXTENSION**

# `ProcessResult`

## Properties
### `success`

```swift
public var success: Bool
```

> Returns `true` if the process finalized with exit code 0.
> Returns `false` if the process finished with any non-zero
> exit code or if it was terminated with a signal.

### `standardOutput`

```swift
public var standardOutput: String
```

> Captured UTF8 standard output, if any.

### `standardError`

```swift
public var standardError: String
```

> Captured UTF8 error output, if any.
