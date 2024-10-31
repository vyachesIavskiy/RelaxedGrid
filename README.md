#  Relaxed Grid

A grid layout inspired by Apple Weather app.

![Simulator Screenshot - iPad Air 11-inch (M2) - 2024-10-31 at 11 07 05](https://github.com/user-attachments/assets/93574f71-0ff5-4641-a5b7-5c800fe6e907)
![Simulator Screenshot - iPad Air 11-inch (M2) - 2024-10-31 at 11 07 44](https://github.com/user-attachments/assets/b02250b6-f097-45b3-b3f8-0917e17dee09)

1. Installation
2. Usage

## Installation

You can add RelaxedGrid to an Xcode project by adding it as a package dependency.

1. From the File menu, select Add Package Dependencies...
2. Enter "https://github.com/vyacheslavskiy/RelaxedGrid" into the package repository URL text field
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
