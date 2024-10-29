#  Relaxed Grid

A grid layout inspired by Apple Weather app.

1. Installation
2. Usage

## Installation

You can add RelaxedGrid to an Xcode project by adding it as a package dependency.

1. From the File menu, select Add Package Dependencies...
2. Enter "https://github.com/vyacheslavskiy/relaxed-grid" into the package repository URL text field
3. add RelaxedGrid directly to your application

## Usage

```swift
import SwiftUI
import RelaxedGrid

struct MyView: View {
    var body: some View {
        RelaxedGrid {
            // You sections go here
        }
    }
}
```

Please take a note, that RelaxedGrid completely ignores sections footers.

You can find an example of usage of RelaxedGrid in a Demo folder of this package.
