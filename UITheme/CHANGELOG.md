#  Installation & Update

To install or update the pod, simply ensure you have "pod `DevTools`" in your PodFile, and use `pod update` to update or install the pod.

# What's Changed in 1.2?

## General & Sample Project

* We have a changelog! Yep, this shiny thing your reading is what is new!
* Project has been reorganized file wise to help better find one's way around! No more getting lost for the ummm.... what file was it?

## UITheme Manager

* `UITheme.manager.enableTheme()` is now stable. This was a bug with `UIThemeElement` and will be detailed below.
* Your element pool can now be validated! No more guessing and failing! Simply do the following
```
let validate = UITheme.manager.validatePool()
if validate.error != nil {
    print("Validation Failed")
    print("Element: \(describing: validation.element?.debugDescription)")
    print("Error: \(validation.error!.localizedDescription)")
}
```
* `.enableTheme` and `.disableTheme` have been updated to no longer throw an error. This is because the old throwing method did not handle failed objects, and could leave the user (you) in a loop of bad objects. Here are your options now:
    > `UITheme` still auto forces the theme to change if it comes across a bad object. Disabling this will REVERT any changes made up to the failed object.
    > You can disable this by setting `UITheme.manager.forceFailedChange` to `false`
    > This force change can be animated by setting `UITheme.manager.animateForceChange` to `true`

## UITheme Profiles

* No major updates (I have one in the works though)

## UITheme Element

* `UIThemeElement` is now stable. Turned out `UIView` was overriding some objects, it has been put in timeout and swears it won't do it again.
* Comments have been updated to correct an error with perameters.
* `UIThemeElement` can now be validated! No more guessing if your element will work. Just call `[your_element].validate()`

## Extentions

* No major extention updates (but you might find the comments are a little different if you like reading that stuff!)


# Known Bugs

* Comments may be a little messed up, turns out I can't spell (well, I knew that one). Who knew perameter wasn't spelled peremeter? ¯\_(ツ)_/¯
