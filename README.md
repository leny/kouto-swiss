# kouto swiss

[![NPM version](http://img.shields.io/npm/v/kouto-swiss.svg)](https://www.npmjs.org/package/kouto-swiss) [![Build Status](http://img.shields.io/travis/krkn/kouto-swiss.svg)](https://travis-ci.org/krkn/kouto-swiss) ![Dependency Status](https://david-dm.org/krkn/kouto-swiss.svg) ![Downloads counter](http://img.shields.io/npm/dm/kouto-swiss.svg)

> A complete CSS framework for [Stylus](http://learnboost.github.io/stylus/)

* * *

**kouto swiss** is a complete CSS framework for Stylus, inspired by great tools like nib, compass, bourbon…

## Installation

```bash
$ npm install kouto-swiss
```

## Usage

### Included in compilation, with grunt or gulp.

#### Grunt

For grunt, you can use [grunt-contrib-stylus](https://www.npmjs.org/package/grunt-contrib-stylus), and include **kouto swiss** in your `use` option for the task.

You can also use [grunt-ks-stylus](https://www.npmjs.org/package/grunt-ks-stylus), which is a fork of **grunt-contrib-stylus**, with **kouto swiss** included.

#### Gulp

For gulp, use [gulp-stylus](https://www.npmjs.org/package/gulp-stylus) and include **kouto swiss** in your `use` option for the task.

### As middleware, for *on the fly* compilation.

There's an exemple of how to use stylus with kouto-swiss within Connect or Express.

```javascript
var connect = require( "connect" ),
    stylus = require( "stylus" ),
    koutoSwiss = require( "kouto-swiss" ),
    server = connect();
    
function compile( str, path ) {
    return stylus( str )
        .set( "filename", path )
        .set( "compress", true )
        .use( koutoSwiss() );
}

server.use( stylus.middleware( {
    src: __dirname,
    compile: compile
} ) );
    
```

## Stylus API

To gain access to the kouto swiss tools from your Stylus files, simply add:

```stylus
@import "kouto-swiss"
```

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style.  
Add unit tests and update the docs for any new or changed functionality.  
More informations in the `CONTRIBUTING.md` file.

### Special call for contribution : something who write better english than mine !

> As you can guess from my spelling, english **isn't** my first language. And as I make prodigious efforts to try, I still can't write good and readable documentation as a native speaker should.

If you want to help the **kouto swiss** project, but don't want to write code, please, consider a little review of the docs, correcting my *very bad* english.  
Many thanks !

## Release History

- **2014-06-30:** version `0.8.0` : first stable version of the lib, including website & docs.
- **2014-05-20:** version `0.1.0` : first version of the lib, including nearly all the basics.
- **2014-05-05:** version `0.0.1` : first publish on npm, still in early stages of development.
- **2014-05-03:** starting project

### Development TODO

- [ ] add kouto-swiss lib to bower
- [ ] write how-to for CodeKit & Prepros
- [ ] docset for [dash](http://kapeli.com/dash)
- [ ] release 0.9
- [ ] community returns
- [ ] **release 1.0**
- [ ] grid background helper

## License

Copyright (c) 2014 [krkn](http://krkn.be)  
Licensed under the MIT license.

### Licenses for ressources used in docs

#### Fonts

* [Norwester by Jamie Wilson](http://jamiewilson.io/norwester/) ([SIL Open Font License](http://scripts.sil.org/OFL))
* [Fira Sans & Fira Mono by Mozilla](https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/) ([SIL Open Font License](http://scripts.sil.org/OFL))
