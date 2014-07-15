# Vendors Prefixes

**kouto swiss** comes with automatic vendor prefixer for the following properties.  
You can define the behavior of the prefixer by changing the value of the global variable `ks-vendors-prefixes`.

## Recommended prefixes (by default)

By default, **kouto swiss** use the data from [caniuse](http://caniuse.com) website to select the prefixes to use.

You can select which version of browsers you want to support by modifying the following global variables.

    ks-support-ie = 8
    ks-support-firefox = 25
    ks-support-chrome = 20
    ks-support-safari = 5
    ks-support-opera = 15
    ks-support-ios-safari = 5
    ks-support-opera-mini = false
    ks-support-android-browser = false
    ks-support-blackberry-browser = false
    ks-support-opera-mobile = false
    ks-support-android-chrome = false
    ks-support-android-firefox = false
    ks-support-ie-mobile = false
    
You can set a number, which will act as "*greater or equal*" support, a [semver range](https://github.com/isaacs/node-semver#ranges) string, or the `false` value, to be ignored.

If you want to ignore the [caniuse](http://caniuse.com) recommandations, add the features you want to ignore to the `ks-support-ignore-features` global variable.

For the properties not registered in [caniuse](http://caniuse.com), the implementation is based on [the list of Peter Beverloo](http://peter.sh/experiments/vendor-prefixed-css-property-overview/).

You can set the following global variable to use the recommended prefixes for the variable.

    ks-vendors-prefixes = recommended

The following properties are not registered in [caniuse](http://caniuse.com).

* **appearance:** `-webkit` `-moz`

* **backface-visibility:** `-webkit` `-ms`

* **clip-path:** `-webkit`

## Specific prefixes

If you want specific prefixes, you can force them by setting the global variable `ks-vendors-prefixes` with the prefixes you want.  

## No vendor prefixes

    ks-vendors-prefixes = false

If you don't want to let **kouto swiss** to add vendor prefixes, and do the job yourself with such plugins like `autoprefixer`, simply set `ks-vendors-prefixes` to false.

## The `vendor` mixin

You can also define your own vendors mixins with the **kouto swiss** built-in vendor mixin.

`vendor( property, value [, feature = null [, prefixes = null [, official = true ] ] ] )`

* `property`: the css property to use.
* `value`: the value for the property.
* `feature`: the name of the feature in [caniuse](http://caniuse.com) website, which will automatically set the prefixes.
* `prefixes`: the list of prefixes to use, if `feature` is set to false.
* `official`: a boolean to display the non-prefixed property, if `feature` is set to false. 

### Usage

```stylus

button
    align-content stretch

ks-support-ie = 11

button
    align-content stretch

ks-vendors-prefixes = o ms webkit moz

button
    clip-path none

ks-vendors-prefixes = recommended

button
    clip-path none

ks-vendors-prefixes = false

button
    clip-path none
    
button
    vendor( "columns", auto auto, feature: "multicolumn" )
    
button
    vendor( "columns", auto auto, prefixes: webkit moz ms o )

button
    vendor( "columns", auto auto, prefixes: webkit moz ms o, official: false )
    
ks-support-ignore-features = "css3-boxsizing" "css-animation"

button
    animation none 0s ease 0s 1 normal none
    box-sizing content-box
```

### Result

```css
button {
  -webkit-align-content: stretch;
  -ms-align-content: stretch;
  align-content: stretch;
}
button {
  -webkit-align-content: stretch;
  align-content: stretch;
}
button {
  -o-clip-path: none;
  -ms-clip-path: none;
  -webkit-clip-path: none;
  -moz-clip-path: none;
  clip-path: none;
}
button {
  -webkit-clip-path: none;
  clip-path: none;
}
button {
  clip-path: none;
}
button {
  -webkit-columns: auto auto;
  -moz-columns: auto auto;
  columns: auto auto;
}
button {
  -webkit-columns: auto auto;
  -moz-columns: auto auto;
  -ms-columns: auto auto;
  -o-columns: auto auto;
  columns: auto auto;
}
button {
  -webkit-columns: auto auto;
  -moz-columns: auto auto;
  -ms-columns: auto auto;
  -o-columns: auto auto;
}
button {
  animation: none 0s ease 0s 1 normal none;
  box-sizing: content-box;
}
```
