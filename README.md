# Omnia

[![Version](https://img.shields.io/cocoapods/v/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Platform](https://img.shields.io/cocoapods/p/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
![Swift](https://img.shields.io/badge/%20in-swift%204.0-orange.svg)

![](Screenshots/Artboard.png)

## Description

**Omnia** contains a huge collection of handy extensions for your everyday project. Inspired by utility and standard libraries from many other languages such as Kotlin, Ruby, Javascript, Haskell, ... **Omnia** implements the most necessary extensions. It won't add 💩 or anti patterns.

All extension names use prefix `omnia_` to avoid potential conflicts, and to give you clue that these are not built in by default.

Supports iOS, macOS, tvOS, watchOS.

For other sugar

- [Anchors](https://github.com/onmyway133/Anchors) ⚓️ Declarative, extensible, powerful Auto Layout
- [On](https://github.com/onmyway133/On) 🍩 Unified communication pattern for iOS and macOS
- [Smile](https://github.com/onmyway133/Smile) 😄 Emoji in Swift

## Usage

#### Bundle

```swift
omnia_name
omnia_versionNumber
omnia_buildNumber
```

#### Comparable

```swift
omnia_isBetween(min: Self, max: Self)
```

#### Data

```swift
omnia_hexString
```

#### Optional

```swift
omnia_isPresent
omnia_unwrap(message: String)
omnia_let(closure: (Wrapped) -> Void)
```

#### Sequence

```swift
omnia_shuffled()
```

#### String

```swift
omnia_capitalizedFirstLetter
omnia_localized
```

#### UICollectionView

```swift
omnia_register<T: UICollectionViewCell>(cellType: T.Type)
omnia_dequeue<T: UICollectionViewCell>(for indexPath: IndexPath)
```

#### UIColor

```swift
init(omnia_hex hex: String)
omnia_toHSL()
init(omnia_hslColor hslColor: HSLColor)
omnia_random()
omnia_darken(amount: CGFloat = 0.2)
omnia_lighten(amount: CGFloat = 0.2)
```

#### UIImage

```swift
init?(omnia_color color: UIColor, size: CGSize)
```

#### UIScrollView

```swift
omnia_scrollToBottom()
```

#### UITableView

```swift
omnia_register<T: UITableViewCell>(cellType: T.Type)
omnia_dequeue<T: UITableViewCell>(for indexPath: IndexPath)
```

#### UIView

```swift
omnia_toImage()
```

#### UIViewController

```swift
omnia_add(childController: UIViewController)
omnia_remove()
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
