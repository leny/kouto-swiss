// caniuse( property )
// returns prefixes list for vendors functions

var oCanIUse = require( "caniuse-db/data.json" );

// console.log( caniuse );

module.exports = function() {
    return function( oStyle ) {
        style.define( "caniuse", function( sPropery ) {
            console.log( "caniuse:", sPropery );
        } );
    };
};
