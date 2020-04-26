<p align="center">
    <img src="Art/EZConstraints.png" width="890" alt="EZConstraintsConstraints"/>
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
- [X] Better debugging experience with a meaningful indentifiers.

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
```
view.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0),
    view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0),
    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
    view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0)
])
```
With `EZConstraints`:
```
view.edgesToSuperView()
```

### Centering in superview
Centering the view in the superview with `NSAutoLayout`:
```
view.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
    view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
])
```
With `EZConstraints`:
```
view.center()
```
or:
```
view.center(offset: CGPoint(x:20, y:10))
```

## Usage


## Author
[Mohamed Shiha](https://github.com/MohamedShiha)

## License
EZConstraints is released under the MIT license. [See LICENSE](https://github.com/MohamedShiha/EZConstraints/blob/master/LICENSE) for details.

## Contributions
If you have feature requests or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/MohamedShiha/EZConstraints/issues/new).
