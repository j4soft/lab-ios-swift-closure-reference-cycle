# Lab | iOS Swift: Detecting memory leaks in closures with Swift

## Description

The purpose of this example is to find out how to detect memory leaks, also known as reference cycles, when using closures and how to fix them.

This example is based on Apple's [Swift 2.1 documentation illustrating strong reference cycles with closures](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html), which explains how memory leaks (reference cycles) occur and how to fix them.

Look at the comments in the ```ViewController.swift``` and ```HTMLElement.swift``` classes for information where the memory leak occurs and how to fix it.

## Prerequisites

- iOS 9.0 and above
- Swift 2.0 and above
- Xcode 7

## Introduction

This example has been set to create a memory leak, as shown in the code extract below from the ```HTMLElement``` class:

```swift
lazy var asHTML: Void -> String = {
    // MARK: Uncomment the code below to solve the memory leak by declaring "self" as an "unowned" reference.
//        [unowned self] in
    if let text = self.text {
        return "<\(self.name)>\(self.text)</\(self.name)>"
    } else {
        return "<\(self.name)/>"
    }
}
```

### Profiling for memory leaks steps overview

The steps to profile the application for memory leaks are:

1. Launch the application for profiling.
2. Select the ```Leaks``` template in ```Instruments```.
3. Switch to the ```Simulator``` and click the ```Leak``` button.
4. Switch to ```Instruments``` and wait for ```Instruments``` to show a red mark on the ```Leaks Checks``` row.
5. Stop profiling.
6. Drill down to the source code

### Profiling the application for memory leaks

Launch the application for profiling by selecting  ```Profile``` from the ```Product``` menu in Xcode:
![Profile app](/Images/Profile menu.png)

In ```Instruments``` select the ```Leaks``` template:
![Leaks](/Images/Instruments leaks.png)

Start profiling the application by clicking on the ```Record``` button:
![Record](/Images/Start profiling.png)

Switch to the ```Simulator``` and click on the ```Leak``` button:
![Leak button](/Images/App Screen Shot .png)

Switch back to ```Instruments``` and wait until a red mark appears on the ```Leak Checks``` row:

![Memory leak detected.png](/Images/Memory leak detected.png)

Select the ```HTMLElement``` leak and click on the arrow in the ```Address``` column:

![Selected memory leak](/Images/Selected memory leak.png)

Clicking on the ```Address``` column displays the backtrace of the memory leak:

![Memory leak backtrace](/Images/Memory leak backtrace.png)

Selecting the ```HTMLElement.asHTML.getter``` displays the source code responsible for the memory leak:

![Memory leak code location](/Images/Memory leak code location.png)

### Fixing the memory leak

To fix the memory leak, uncomment the ```[unowned self] in``` line in:

```swift
lazy var asHTML: Void -> String = {
    // MARK: Uncomment the code below to solve the memory leak by declaring "self" as an "unowned" reference.
//        [unowned self] in
    if let text = self.text {
        return "<\(self.name)>\(self.text)</\(self.name)>"
    } else {
        return "<\(self.name)/>"
    }
}
```

Profile again the application for memory leaks and click on the ```Leak``` button on the ```Simulator```.

You will see that there is no memory leak anymore:

![No more leaks](/Images/No more leaks.png)

## Issues

Report issues at [lab-ios-swift-closure-reference-cycle/issues](https://github.com/j4soft/lab-ios-swift-closure-reference-cycle/issues).

## License

All source code is distributed under the [Apache Software License (ASL) 2.0](LICENSE).

## Copyright

© 2016 J4SOFT. All rights reserved.
