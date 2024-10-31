#  Relaxed Grid

A grid layout inspired by Apple Weather app.

## Screenshots
Portrait

<img src="https://github.com/user-attachments/assets/93574f71-0ff5-4641-a5b7-5c800fe6e907" alt="Portrait" width="600"/>

Landscape

<img src="https://github.com/user-attachments/assets/b02250b6-f097-45b3-b3f8-0917e17dee09" alt="Landscape" width="800"/>

## Table of contents

1. [Installation](#installation)
2. [Usage](#usage)

## Installation <a name="installation"></a>

You can add RelaxedGrid to an Xcode project by adding it as a package dependency.

1. From the File menu, select Add Package Dependencies...
2. Enter "https://github.com/vyacheslavskiy/RelaxedGrid" into the package repository URL text field
3. add RelaxedGrid directly to your application

## Usage <a name="usage"></a>

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
