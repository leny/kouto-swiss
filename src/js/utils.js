/* leny/kouto-swiss
 *
 * /src/js/utils.js - Utils for pug/jade templates
 *
 * coded by leny@flatLand!
 * started at 07/12/2016
 */

var fs = require( "fs" ),
    marked = require( "marked" );

exports.date_format = function( sDate ) {
    var dDate = new Date( sDate );

    return dDate.toLocaleDateString( "en-GB", {
        "year": "numeric",
        "month": "long",
        "day": "numeric",
    } );
};

exports.capitalize = function( sSource ) {
    return sSource[ 0 ].toUpperCase() + sSource.substr( 1 );
};

exports.chapter_entry_content = function( sChapter, sEntry ) {
    return marked( fs.readFileSync( __dirname + "/../docs/" + sChapter + "/" + sEntry + ".md", "utf8" ) );
};
