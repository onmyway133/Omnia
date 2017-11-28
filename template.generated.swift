// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



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
