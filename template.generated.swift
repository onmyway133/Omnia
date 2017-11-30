// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



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

#### NSObject

```swift
e_apply(closure: (Self) -> Void)
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

#### UICollectionView

```swift
e_register<T: UICollectionViewCell>(cellType: T.Type)
e_dequeue<T: UICollectionViewCell>(for indexPath: IndexPath)
```

#### UIColor

```swift
init(e_hex hex: String)
e_toHSL()
init(e_hslColor hslColor: HSLColor)
e_random()
e_darken(amount: CGFloat = 0.2)
e_lighten(amount: CGFloat = 0.2)
```

#### UIImage

```swift
init?(e_color color: UIColor, size: CGSize)
```

#### UIScrollView

```swift
e_scrollToBottom()
```

#### UITableView

```swift
e_register<T: UITableViewCell>(cellType: T.Type)
e_dequeue<T: UITableViewCell>(for indexPath: IndexPath)
```

#### UIView

```swift
e_toImage()
```

#### UIViewController

```swift
e_add(childController: UIViewController)
e_remove()
```


#### TypeAddOnAware

```swift
e_apply(closure: (Self) -> Void)
```
