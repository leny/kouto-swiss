# row()

Init a row for the current grid system.

### Signature

`row()`

### Usage

```stylus
div
    row()

gs( "fixed", 16, 40px, 10px )

div
    row()

gs( "fluid" )

div
    row()

gs( "fluid", 10, 9% )

div
    row()
```

### Result

```css
div {
  display: block;
  width: 980px;
  margin: 0 -10px;
}
div {
  display: block;
  width: 810px;
  margin: 0 -5px;
}
div {
  display: block;
  width: 100.83333333333331%;
  margin: 0 -0.4166666666667%;
}
div {
  display: block;
  width: 101%;
  margin: 0 -0.5%;
}
```
