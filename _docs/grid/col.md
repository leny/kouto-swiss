# col()

Init a column of the given size for the current grid system.

### Signature

`col( [ size ] )`

* `size`: size of the column. *Optional* Default to the total of columns in the grid.

### Usage

```stylus
div
    col()

div
    col( 1 )

div
    col( 6 )

gs( "fixed", 16, 40px, 10px )

div
    col()

div
    col( 1 )

div
    col( 6 )

gs( "fluid" )

div
    col()

div
    col( 1 )

div
    col( 6 )

gs( "fluid", 10, 9% )

div
    col()

div
    col( 1 )

div
    col( 6 )

```

### Result

```css
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 940px;
  margin: 0 10px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 60px;
  margin: 0 10px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 460px;
  margin: 0 10px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 790px;
  margin: 0 5px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 40px;
  margin: 0 5px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 290px;
  margin: 0 5px;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 99.1666666666667%;
  margin: 0 0.4166666666667%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 7.5%;
  margin: 0 0.4166666666667%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 49.1666666666667%;
  margin: 0 0.4166666666667%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 99%;
  margin: 0 0.5%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 9%;
  margin: 0 0.5%;
}
div {
  display: inline-block;
  float: left;
  overflow: hidden;
  width: 59%;
  margin: 0 0.5%;
}

```
