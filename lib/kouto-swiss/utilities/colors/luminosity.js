// luminosity( color )
// returns the luminosity value according to WCAG (http://www.w3.org/TR/WCAG20/#relativeluminancedef)
// inspired by https://npmjs.org/package/color

module.exports = function() {
    return function( style ) {
        var _getChannelLuminosity = function( value ) {
            var channel = value / 255;
            return ( channel <= 0.03928 ) ? channel / 12.92 : Math.pow( ( ( channel + 0.055 ) / 1.055 ), 2.4 );
        };

        style.define( "luminosity", function( color ) {
            return 0.2126 * _getChannelLuminosity( color.r ) + 0.7152 * _getChannelLuminosity( color.g ) + 0.0722 * _getChannelLuminosity( color.b );
        } );
    };
};
