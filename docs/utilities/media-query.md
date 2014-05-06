# media-query()

Create the query part of a media query, which you can store in a variable, to use when you make a media block.  

### Signature

`media-query( media [, conditions... ] )`

* `media`: the media of the query
* `conditions`: multiple pairs of conditions for the query. *Optional*.

### Usage

```stylus
query-one = media-query( all, min-width 640px )
query-two = media-query( only screen, min-width 640px, min-height 960px, orientation portrait )
query-three = media-query( print )

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
@media all and (min-width: 640px) {
  div {
    color: #f00;
  }
}
@media only screen and (min-width: 640px) and (min-height: 960px) and (orientation: portrait) {
  div {
    color: #f00;
  }
}
@media print {
  div {
    color: #f00;
  }
}
```
