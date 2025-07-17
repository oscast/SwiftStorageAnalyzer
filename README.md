# StorageAnalyzer

`StorageAnalyzer` is a SwiftUI package that provides a view to display the used and total storage of the device.

## Features

*   A semi-circular progress view to visualize storage usage.
*   Displays the used and total storage in GB.
*   Easy to integrate into any SwiftUI application.

## Usage

To use `StorageAnalyzer` in your project, simply add it as a package dependency in Xcode and then use the `StorageAnalyzerView` in your SwiftUI views:

```swift
import SwiftUI
import StorageAnalyzer

struct ContentView: View {
    var body: some View {
        StorageAnalyzerView()
    }
}
```

## Installation

### Swift Package Manager

You can add `StorageAnalyzer` to your Xcode project as a package dependency.

1.  From the **File** menu, select **Add Packages...**
2.  Enter the package URL: `https://github.com/yourusername/StorageAnalyzer.git` (Replace `yourusername` with the actual GitHub username or organization).
3.  Select the `StorageAnalyzer` package and add it to your project.
