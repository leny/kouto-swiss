# retina-query()

Create the query part of a media query for retina/hdpi screens, which you can store in a variable, to use when you make a media block.  

### Signature

`retina-query( media [, density ] )`

* `media`: the media of the query
* `density`: pixel density for the query. *Optional*. Default to `1`.

### Usage

```stylus
query-one = retina-query( all, 1.3 )
query-two = retina-query( only screen, 2 )
query-three = retina-query( screen )

@media query-one
    div
        color red

@media query-two
    div
        color red

@media query-three
    div
        color red
```

### Result

```css
@media all and (-webkit-min-device-pixel-ratio: 1.3), all and (min--moz-device-pixel-ratio: 1.3), all and (-o-min-device-pixel-ratio: 1.3/1), all and (min-device-pixel-ratio: 1.3), all and (min-resolution: 125dpi), all and (min-resolution: 1.3dppx) {
  div {
    color: #f00;
  }
}
@media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {
  div {
    color: #f00;
  }
}
@media screen and (-webkit-min-device-pixel-ratio: 1), screen and (min--moz-device-pixel-ratio: 1), screen and (-o-min-device-pixel-ratio: 1/1), screen and (min-device-pixel-ratio: 1), screen and (min-resolution: 96dpi), screen and (min-resolution: 1dppx) {
  div {
    color: #f00;
  }
}
```
