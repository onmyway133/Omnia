# Omnia

[![Version](https://img.shields.io/cocoapods/v/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Platform](https://img.shields.io/cocoapods/p/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
![Swift](https://img.shields.io/badge/%20in-swift%204.0-orange.svg)

![](Screenshots/Artboard.png)

## Description

**Omnia** contains a huge collection of handy extensions for your everyday project. Inspired by utility and standard libraries from many other languages such as Kotlin, Ruby, Javascript, Haskell, ... **Omnia** implements the most necessary extensions. It won't add 💩 or anti patterns.

All extension names use prefix `e` (e stands for extension) to avoid potential conflicts, and to give you clue that these are not built in by default.

Supports iOS, macOS, tvOS, watchOS.

For other sugar

- [Anchors](https://github.com/onmyway133/Anchors) ⚓️ Declarative, extensible, powerful Auto Layout
- [On](https://github.com/onmyway133/On) 🍩 Unified communication pattern for iOS and macOS
- [Smile](https://github.com/onmyway133/Smile) 😄 Emoji in Swift
- [Wave](https://github.com/onmyway133/Wave) 🌊 Declarative chainable animations in Swift

## Usage

#### Bundle

```swift
e_name
e_versionNumber
e_buildNumber
```

#### Comparable

```swift
e_isBetween(min: Self, max: Self)
```

#### Data

```swift
e_hexString
```

#### NSColor

```swift
init(e_hex hex: String)
```

#### NSObject

```swift
e_apply(closure: (Self) -> Void)
```

#### NSView

```swift
e_addSubviews(_ views: [NSView])
```

#### Optional

```swift
e_isPresent
e_unwrap(message: String)
e_let(closure: (Wrapped) -> Void)
```

#### Sequence

```swift
e_shuffled()
```

#### String

```swift
e_capitalizedFirstLetter
e_localized
```

#### TypeAddOnAware

```swift
e_apply(closure: (Self) -> Void)
```

## Installation

**Omnia** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Omnia'
```

**Omnia** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/Omnia"
```

**Omnia** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Khoa Pham, onmyway133@gmail.com

## Credit

- Extensions methods and properties in README are generated using [Sourcery](https://github.com/krzysztofzablocki/Sourcery)
- Many answers on Stackoverflow.

## License

**Omnia** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/Omnia/blob/master/LICENSE.md) file for more info.
