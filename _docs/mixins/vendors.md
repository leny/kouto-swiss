# Vendors Prefixes

**Kouto Swiss** comes with automatic vendor prefixer for the following properties.  

You can define the behavior of the prefixer by changing the value of the global variable `ks-vendors-prefixes`.

## Recommended prefixes (by default)

    ks-vendors-prefixes = recommended

For each property, the added vendor prefixes are given.  
The implementation is based on [the list of Peter Beverloo](http://peter.sh/experiments/vendor-prefixed-css-property-overview/)_

* **align-content:** `-webkit`
* **align-items:** `-webkit`
* **align-self:** `-webkit`

* **animation:** `-webkit` `-ms`
* **animation-delay:** `-webkit` `-ms`
* **animation-direction:** `-webkit` `-ms`
* **animation-duration:** `-webkit` `-ms`
* **animation-fill-mode:** `-webkit` `-ms`
* **animation-iteration-count:** `-webkit` `-ms`
* **animation-name:** `-webkit` `-ms`
* **animation-play-state:** `-webkit` `-ms`
* **animation-timing-function:** -webkit` `-ms`

* **appearance:** `-webkit` `-moz`

* **backface-visibility:** `-webkit` `-ms`

* **background-clip:** `-webkit`
* **background-origin:** `-webkit`
* **background-size:** `-webkit`

* **clip-path:** `-webkit`

* **column-count:** `-webkit` `-moz`
* **column-fill:** `-webkit` `-moz`
* **column-gap:** `-webkit` `-moz`
* **column-rule:** `-webkit` `-moz`
* **column-rule-color:** `-webkit` `-moz`
* **column-rule-style:** `-webkit` `-moz`
* **column-rule-width:** `-webkit` `-moz`
* **column-span:** `-webkit`
* **column-width:** `-webkit` `-moz`
* **columns:** `-webkit` `-moz`

* **filter:** `-webkit` 

* **flex:** `-webkit` `-ms`
* **flex-basis:** `-webkit`
* **flex-direction:** `-webkit` `-ms`
* **flex-flow:** `-webkit` `-ms`
* **flex-grow:** `-webkit`
* **flex-shrink:** `-webkit`
* **flex-wrap:** `-webkit` `-ms`

* **grid:** `-webkit` `-ms`
* **grid-area:** `-webkit`
* **grid-auto-columns:** `-webkit`
* **grid-auto-flow:** `-webkit`
* **grid-auto-position:** `-webkit`
* **grid-auto-rows:** `-webkit`
* **grid-column:** `-webkit` `-ms`
* **grid-column-end:** `-webkit`
* **grid-column-start:** `-webkit`
* **grid-row:** `-webkit` `-ms`
* **grid-row-end:** `-webkit`
* **grid-row-start:** `-webkit`
* **grid-template:** `-webkit`
* **grid-template-areas:** `-webkit`
* **grid-template-columns:** `-webkit`
* **grid-template-rows:** `-webkit`

* **justify-content:** `-webkit`

* **mask:** `-webkit`

* **opacity:** opacity use filter for IE browsers

* **perspective:** `-webkit`
* **perspective-origin:** `-webkit`

* **transform:** `-webkit` `-moz` `-o`
* **transform-origin:** `-webkit` `-o`
* **transform-style:** `-webkit`

* **transition:** `-webkit` `-o`
* **transition-delay:** `-webkit` `-o`
* **transition-duration:** `-webkit` `-o`
* **transition-property:** `-webkit` `-o`
* **transition-timing-function:** `-webkit` `-o`

## Specific prefixes

If you want specific prefixes, you can force them by setting the global variable `ks-vendors-prefixes` with the prefixes you want.  

## No vendor prefixes

    ks-vendors-prefixes = false

If you don't want to let **kouto swiss** to add vendor prefixes, and do the job yourself with such plugins like `autoprefixer`, simply set `ks-vendors-prefixes` to false.

### Usage

```stylus
ks-vendors-prefixes = o ms webkit moz

button
    mask border-box

ks-vendors-prefixes = recommended

button
    mask border-box

ks-vendors-prefixes = false

button
    mask border-box
```

### Result

```css
button {
  -o-mask: border-box;
  -ms-mask: border-box;
  -webkit-mask: border-box;
  -moz-mask: border-box;
  mask: border-box;
}
button {
  -webkit-mask: border-box;
  mask: border-box;
}
button {
  mask: border-box;
}
```
