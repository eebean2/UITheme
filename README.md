#  UITheme

[![Version](https://img.shields.io/cocoapods/v/DevTools.svg?style=flat)](http://cocoapods.org/pods/DevTools)
[![License](https://img.shields.io/cocoapods/l/DevTools.svg?style=flat)](http://cocoapods.org/pods/DevTools)
[![Platform](https://img.shields.io/cocoapods/p/DevTools.svg?style=flat)](http://cocoapods.org/pods/DevTools)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=AFQ67C767PDPL)

UITheme is a part of [Devtools](http://cocoapods.org/pods/DevTools), a suite of tools designed to help developers for the Apple ecosystem simplify their work. The above Version, License, and Platforms apply to DevTools Cocoapod [found here](http://cocoapods.org/pods/DevTools), as this code is developed as part of the pod. Code in the pod will usually be updated first, and/or be adapted or custimized for the pod.

## Saving your Theme Preferences

To save your theme preferences for an object, you use `UIThemeProfile`. Most UIKit objects are supported, and almost anything that can be custimized in code can be themed.

The following objects are available:

```
UIThemeProfile.view(defaultBackground: UIColor, themeBackground: UIColor)
UIThemeProfile.label(defaultTextColor: UIColor, themeTextColor: UIColor)
UIThemeProfile.button()
UIThemeProfile.textfield()
UIThemeProfile.slider()
UIThemeProfile.activityindicator()
UIThemeProfile.switch()
UIThemeProfile.progressbar()
UIThemeProfile.pagecontrol(defaultPagesColor:, themePagesColor:, defaultCurrentPageColor:, themeCurrentPageColor:)
UIThemeProfile.stepper()
UIThemeProfile.segmentedcontroller()
UIThemeProfile.tableview()
UIThemeProfile.tableviewcell()
UIThemeProfile.imageview()
UIThemeProfile.collectionview()
UIThemeProfile.collectionviewcell()
UIThemeProfile.textview()
UIThemeProfile.scrollview()
UIThemeProfile.datepicker()
UIThemeProfile.pickerview()
UIThemeProfile.navigationbar()
UIThemeProfile.toolbar()
UIThemeProfile.barbuttonitem()
UIThemeProfile.tabbar()
UIThemeProfile.tabbaritem()
UIThemeProfile.searchbar()
```

## Enabling the Theme

To enable the theme, simply call

`[your_object].enableTheme(profile: UIThemeProfile)`

OR

```
UIView.animate(withDuration: 0.5) {
    [your_object].enableTheme(profile: UIThemeProfile, animate: false)
}
```

## Disabling the Theme

To disable the theme, simply call

`[your_object].disableTheme(profile: UIThemeProfile)`

OR

```
UIView.animate(withDuration: 0.5) {
    [your_object].disableTheme(profile: UIThemeProfile, animate: false)
}
```

## To Change Themes

If you wish to change your themed item, simply edit your `UIThemProfile` and re-call `.enableTheme` if you edited your themed section of the profile, or `.disableProfile` if you edited the default section of the profile.

Enable theme will ALWAYS use the theme section of any profile, and disable theme will use the default section of any profile.

## Found a BUG?

Please report it [here](https://github.com/eebean2/DevTools/issues).
