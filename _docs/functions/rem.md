# rem()

Converts `pixels` to `rem`.  
Assumes `1rem = 16px`. You can override by passing a new value to the global variable `ks-rem-base`.

### Signature

`rem( value )`

* `value`: value to convert.

### Usage

```stylus
div
    font-size rem( 12px )

ks-rem-base = 20px

div
    font-size rem( 16 )
        
```

### Result

```css
div {
  font-size: 0.75rem;
}

div {
  font-size: 0.8rem;
}
```
