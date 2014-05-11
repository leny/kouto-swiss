# gs()

Init (or change) the grid system parameters : type, amount of columns, size, gutters...

### Signature

`gs( [ type [, cols [, col-width [, gut-width ] ] ] ] )`

If the mixin is called from a selector, it will returns some properties to set the grid up.

* `type`: the type of the grid. Can be "`fixed`" (be default) or "`fluid`". *Optional*
* `cols`: amount of columns in the grid. *Optional* Default to `12`.

#### fixed grid

* `col-width`: the size of the columns. *Optional* Default to `60px`.
* `gut-width`: the size of the gutter between columns. *Optional* Default to `20px`.

#### fluid grid

* `col-width`: the size of the columns. All numbers given will be taken as percentages. *Optional* Default to `( 100% / cols ) * 0.9`.
* `gut-width`: the size of the gutter between columns. All numbers given will be taken as percentages. *Optional* Default to `( 100% / cols ) * 0.1`.

When using the `fluid` grid system, only one of the value is used to compute, proportionaly, the size of columns and gutters. If the two values are given, the `col-width` is used.

### Usage

```stylus
body
    gs()

body
    gs( "fixed", 16, 40px, 10px )

body
    gs( "fluid" )

body
    gs( "fluid", 10, 9% )
```

### Result

```css
body {
  width: 960px;
  margin: 0 auto;
  overflow: hidden;
}
body {
  width: 800px;
  margin: 0 auto;
  overflow: hidden;
}
body {
  width: 100%;
  margin: 0 auto;
  overflow: hidden;
}
body {
  width: 100%;
  margin: 0 auto;
  overflow: hidden;
}
```
