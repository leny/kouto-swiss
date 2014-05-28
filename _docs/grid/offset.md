# offset()

Offset a column to the left by the given size, for the current grid system.

### Signature

`offset( [ size ] )`

* `size`: size of the offset. *Optional* Default to `1`.

### Usage

```stylus
div
    col( 1 )
    offset( 3 )

div
    col( 6 )
    offset( 6 )

gs( "fixed", 16, 40px, 10px )

div
    col( 1 )
    offset( 3 )

div
    col( 6 )
    offset( 6 )

gs( "fluid" )

div
    col( 1 )
    offset( 3 )

div
    col( 6 )
    offset( 6 )

gs( "fluid", 10, 9% )

div
    col( 1 )
    offset( 3 )

div
    col( 6 )
    offset( 6 )
```

### Result

```css
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 60px;
  margin: 0 10px;
  margin-left: 250px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 460px;
  margin: 0 10px;
  margin-left: 490px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 40px;
  margin: 0 5px;
  margin-left: 155px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 290px;
  margin: 0 5px;
  margin-left: 305px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 7.5%;
  margin: 0 0.4166666666667%;
  margin-left: 25.4166666666667%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 49.1666666666667%;
  margin: 0 0.4166666666667%;
  margin-left: 50.4166666666667%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 9%;
  margin: 0 0.5%;
  margin-left: 30.5%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 59%;
  margin: 0 0.5%;
  margin-left: 60.5%;
}
```
