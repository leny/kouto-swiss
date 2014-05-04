# Implicit color fallback

The `implicit color fallback` mecanism allows you to use the `color-fallback` function without calling it, by declaring an `ks-color-fallback` variable to `true`.

### Usage

```stylus
.foo
    color rgba( 255, 0, 0, .5 )

ks-color-fallback = true

.bar
    color rgba( 255, 0, 0, .5 )
    
.bar
    background rgba( 202, 43, 120, .5 ) url( test.png ) top left repeat
    
ks-color-fallback = false

.foo
    color rgba( 255, 0, 0, .5 )
    
```

### Result

```css
.foo {
  color: rgba( 255, 0, 0, .5 );
}

.bar {
  color: #f00;
  color: rgba( 255, 0, 0, .5 );
}

.foo {
  background: #ca2b78 url("test.png") top left repeat;
  background: rgba(202,43,120,0.5) url("test.png") top left repeat;
}

.foo {
  color: rgba( 255, 0, 0, .5 );
}
```
