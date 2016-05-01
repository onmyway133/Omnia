# Omnia

Everything your projects need to know

[![CI Status](http://img.shields.io/travis/onmyway133/Omnia.svg?style=flat)](https://travis-ci.org/onmyway133/Omnia)
[![Version](https://img.shields.io/cocoapods/v/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Platform](https://img.shields.io/cocoapods/p/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)

![](Screenshots/Banner.png)

## Description

Some of the utilities I need that don't know where to put

## Features

### Farge
Color

```swift
let _ = UIColor.Farge.hummingBird
```

### Warlock
Swizzling

```
Warlock.swizzleInstance(UIViewController.self, original: #selector(UIViewController.viewDidLoad)) {
  print("your swizzled implementation goes here")
}
```

### Throttle
Throttling

```swift
let throttle = Throttle(interval: 0.5, actionBlock: {
  print("action goes here")
})

throttle.fire()
throttle.fire()
```

### Hourglass
NSTimer

```swift
Hourglass.every(1) {
  print("action runs every 1 second")
}
```

### Performer
GCD

```swift
Performer.on(.background) {
  print("action goes here")
}.delay(2) {
  print("action goes here")          
}

Performer.async(Performer.Queue(name: "queue", attribute: .Serial)) {
  print("action goes here")
}
```

### Emoji
Emoji

```swift
Emoji.flag("NO") // 🇳🇴
Emoji.standardName("😁") // GRINNING FACE WITH SMILING EYES
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

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **Omnia**, check the [CONTRIBUTING](https://github.com/onmyway133/Omnia/blob/master/CONTRIBUTING.md) file for more info.

## License

**Omnia** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/Omnia/blob/master/LICENSE.md) file for more info.
