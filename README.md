# SwiftyBadgeButton
<a href="https://github.com/raphaelcruzeiro/SwiftyBadgeButton/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg?style=flat"/></a>
<a href="https://travis-ci.org/raphaelcruzeiro/SwiftyBadgeButton?branch=master"><img src="https://travis-ci.org/raphaelcruzeiro/SwiftyBadgeButton.svg?branch=master" /></a>
<a href="https://cocoapods.org/?q=SwiftyBadgeButton"><img src="https://cocoapod-badges.herokuapp.com/v/SwiftyBadgeButton/badge.png"/></a>

## Installation

```
use_frameworks!

pod 'SwiftyBadgeButton'
```

## Usage

SwiftyBadgeButton is a subclass of UIButton and can be used just as one. To set the badge, all you need to so is set a text:

```
badgeButton.badgeText = "1"
```

## Properties

- `animated` Sets whether the badge should animate upon setting a badgeText. _Default: true_
- `badgeSize` Sets the default badge size. The width will grow automatically according to the text. The height will always stay the same. _Default: CGSize(width 15, height: 15)
- `badgeBackgroundColor` Sets the badge background color. _Default: UIColor.redColor()_
- `badgeFont` Sets the badge font. _Default: UIFont.systemFontOfSize(10)_
- `badgeTextColor` Sets the badge text color. _Default: UIColor.whiteColor()_


