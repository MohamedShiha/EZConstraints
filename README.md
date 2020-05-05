<p align="center">
    <img src="https://github.com/MohamedShiha/EZConstraints/blob/master/Art/EZConstraints.png" width="890" alt="EZConstraints"/>
</p>

[![Platform](https://img.shields.io/cocoapods/p/EZConstraints.svg?style=flat)](https://cocoapods.org/pods/EZConstraints)
![Cocoapods](https://img.shields.io/badge/Cocoapods-compatible-green)
[![Version](https://img.shields.io/cocoapods/v/EZConstraints.svg?style=flat)](https://cocoapods.org/pods/EZConstraints)
[![License](https://img.shields.io/cocoapods/l/EZConstraints.svg?style=flat)](https://cocoapods.org/pods/EZConstraints)

EZConstraints is an easier and more descriptive way to write auto layout constraints.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Basics](#basics)
- [Usage](#usage)
- [Author](#author)
- [License](#license)
- [Contributions](#contributions)

## Features

- [X] Supports Swift 5.
- [X] Auto Layout but with a simplified meaningful syntax.
- [X] Sets constraints attributes like relation, priority upon creation.
- [X] Constraints are active by default.
- [X] Stores constraints optionally.
- [X] Allows a view to obtain another view layout attributes like size, center, anchors.
- [X] Assigns a layout constraint for a group of views with one call.
- [X] No need to set 'translatesAutoresizingMaskIntoConstraints'.
- [X] Better debugging experience with a meaningful identifiers.

## Requirements
- iOS 10.0+
- Xcode 11+
- Swift 5.1+

## Installation

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate EZConstraints into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'EZConstraints'
```

## Basics
### Typealiases
`EZConstraints` offers more readable typealiases for describing constraints.
- `EZConstraint` = `UILayoutConstraint`
- `EZConstraints` = `[UILayoutConstraint]`
- `EZInsets` = `UIEdgeInsets`

### Filling the superview
Filling the superview with `NSAutoLayout`:
```Swift
view.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0),
    view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0),
    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
    view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0)
])
```
With `EZConstraints`:
```Swift
view.edgesToSuperView()
```

### Centering in superview
Centering the view in the superview with `NSAutoLayout`:
```Swift
view.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
    view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
])
```
With `EZConstraints`:
```Swift
view.center()
```
or:
```Swift
view.center(offset: CGPoint(x:20, y:10))
```

## Usage

### Filling the superview
Filling the superview:
```Swift
view.edgesToSuperView()
```
You can also specify edges and insets:
```Swift
view.edgesToSuperView(including: [.left, .right], insets: .left(8) + .right(8))
```
EZConstraints also supports safe area insets using `edgesToSuperviewSafeArea(including:, insets:)`.

### Laying out in superview

To lay view(s) on top of the superview: 
```Swift
view.layTopInSuperView(constant: 20)
```
You can also use `layLeftInSuperView(constant:)`, `layBottomInSuperView(constant:)` and `layRightInSuperView(constant:)`.

### Laying out
To lay a view below another view:
```Swift
view.layBelow(view2, constant: 16)
```
You can also use `layAbove(_:)`, `layRight(to:)` and `layLeft(to:)`. <br/>

EZConstraints also enables you to lay out views individual margins to safe area.
```Swift
view.layTopToSafeArea(constant: 16)
```
You can also use `layLeftToSafeArea(constant:)`, `layBottomToSafeArea(constant:)` and `layRightToSafeArea(constant:)`. <br/>

Keep in mind that calling `edgesToSuperView` have the same effect as: 
```Swift
view.layTopInSuperView(constant: 0)
view.layLeftInSuperView(constant: 0)
view.layBottomInSuperView(constant: 0)
view.layRightInSuperView(constant: 0)
```
The same applies to `edgesToSuperviewSafeArea`. 

### Centering
EZConstraints supports centering horizontally and vertically:
```Swift
view.centerHorizontally()
view.centerVertically(yOffset: 16)
```
You can also center the view on the superview center:
```Swift
view.center()
```

### Sizing elements
To assign a size constraints that consists of width and height constraints:
```Swift
view.sizeAnchor(CGSize(width: 30, height: 30))
```
Assigning a fixed width:
```Swift
view.widthAnchor(.equal, constant: 100)
```
You can also assign the size, height, width constraint(s) of another view to a a specified view:
```Swift
view.heightAnchor(with: view2)
```
You can also use `heightAnchor(with:)` and `widthAnchor(with:)` for the same purpose.
`squareSizeWith(sideLengthOf:)` gives the view a square shape with a specified side length that is equal for all sides.

Assigning aspect ratio constraint:
```Swift
view.aspectRatio(multiplier: 1.5) // width = height * 1.5
```
Assigning aspect ratio constraint between two views:
```Swift
view.aspectRatio(by: view2, multiplier: 0.5) // view.width = view2.height * 0.5
```

### Debug Identifier
The debug identifier is an id that is assigned automatically to every constraint upon creation. This identifier allows you to debug conflicting constraints by clearing the ambiguity and make it easier to know the reason of the problem.
The identifier has a specified pattern:
` id : <View1 Address>.Function_Name relation <View2 Address> * multiplier + constant(pt)`

Attributes that will not appear in the identifier:
- `<View2 Address>`, If it is `nil` which is the case in 'widthAnchor(_:, constant:)' for example.
- `multiplier`, If `multiplier == 1.0`.
- `constant`, If `constant == 0`.
- Other attributes like `priority`.

#### Examples:
- `id : 0x000000000000.layoutLeftInSuperView = 0x111111111111 + 24.0pt`
- `id : 0x000000000000.widthAnchor =  100.0pt'`


## License
EZConstraints is released under the MIT license. [See LICENSE](https://github.com/MohamedShiha/EZConstraints/blob/master/LICENSE) for details.

## Author
[Mohamed Shiha](https://github.com/MohamedShiha)

## Contributions
If you have feature requests or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/MohamedShiha/EZConstraints/issues/new).
