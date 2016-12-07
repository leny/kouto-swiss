( function( $ ) {

    var $docNavigation;

    $( function() {
        ( $docNavigation = $( "#wrapper > header > nav" ) )
            .find( "a" )
                .on( "click", function() {
                    $docNavigation.removeClass( "open" );
                } );
        $( "#wrapper > header > a" ).on( "click", function( e ) {
            e.preventDefault();
            $docNavigation.toggleClass( "open" );
        } );
    } );

} )( jQuery );
