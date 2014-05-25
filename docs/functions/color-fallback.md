# `color-fallback( color )`

> **Warning:** must be used within a property.

Create a fallback property for color with alpha value different than `1`.  
If the given color has an alpha of `1`, the function doesn't do anything.

### Signature

`color-fallback( color )`

* `color`: color to fallback.

### Usage

```stylus
.no-alpha
    color color-fallback( red )
    
.alpha
    color color-fallback( rgba( 255, 0, 0, .5 ) )
```

### Result

```css
.no-alpha {
  color: #f00;
}
    
.alpha {
  color: #f00;
  color: rgba(255,0,0,0.5);
}
```
