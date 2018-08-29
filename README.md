# System

![System](/system.png)

![Release](https://img.shields.io/github/release/eneko/System.svg)
![Swift 4.1](https://img.shields.io/badge/Swift-4.1-orange.svg)
[![Build Status](https://travis-ci.org/eneko/System.svg?branch=master)](https://travis-ci.org/eneko/System)
[![codecov](https://codecov.io/gh/eneko/System/branch/master/graph/badge.svg)](https://codecov.io/gh/eneko/System)
[![Swift Package Manager Compatible](https://img.shields.io/badge/spm-compatible-brightgreen.svg)](https://swift.org/package-manager)
![Linux Compatible](https://img.shields.io/badge/linux-compatible%20🐧-brightgreen.svg)

Easily execute system commands from a Swift script or command line tool.

**Features**
- ✅ Easily execute child processes with or without capturing output
- ✅ Easily execute shell commands with or without capturing output
- ✅ Option to capture output or stream to stdout/stderr in real time
- ✅ Swift Package Manager compatible
- ✅ Linux compatible 🐧


## Executing child Processes from Swift scripts and CLI tools ✈
Running child processes in Swift is not hard with `Process`, but it can be a
bit tedious and repetitive if done multiple times in the same script or
command line tool.

`system` makes this process extremely easy. If you are familiar with Ruby
scripting (Rakefile, Fastlane, Danger, etc), you will feel like home.

### Automatically redirect output to stdout 💻

```swift
import System

try system(command: "echo hello world") // prints "hello world" to stdout
```

### Capture process output ✇

```swift
import System

let output = try system(command: "echo hello world", captureOutput: true).standardOutput
print(output) // prints "hello world"
```

### Check if process terminated gracefully ✔️

```swift
import System

print(try system(command: "echo hello world").success) // prints "true"
```

### Easily execute Shell commands with pipes and redirects |>

```swift
import System

try system(shell: "echo hello cat > cat && cat cat | awk '{print $2}'") // prints "cat" to stdout
```

## Installation

Add `System` to your `Package.swift`:

```swift
import PackageDescription

let package = Package(
    name: "YourPackage",
    dependencies: [
        .package(url: "git@github.com:eneko/System.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "YourTarget",
            dependencies: ["System"]),
    ]
)
```


## Contact 💌
Follow and/or contact me on Twitter at [@eneko](https://www.twitter.com/eneko).


## Contributions 👏
If you find an issue, just [open a ticket](https://github.com/eneko/System/issues/new)
on it. Pull requests are warmly welcome as well.

## License 👮‍♂️
System is licensed under the MIT license. See [LICENSE](/LICENSE) for more info.
