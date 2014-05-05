# em()

Converts `pixels` to `em`.  
Uses the second value as base. If no base is given, uses `16px` as base.

### Usage

```stylus
div
    font-size em( 12px, 24 )
    
div
    font-size em( 16 )
        
```

### Result

```css
div {
  font-size: 0.5em;
}

div {
  font-size: 1em;
}
```
