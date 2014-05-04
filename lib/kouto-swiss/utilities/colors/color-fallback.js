module.exports = function() {
    return function() {
        var oEvaluator = this.evaluator,
            nodes = this.nodes,
            _fVisitProperty = oEvaluator.visitProperty;

        oEvaluator.visitProperty = function( oNode ) {
            var bFallbackIsActive, i, oExpression, oCall;
            bFallbackIsActive = this.global.scope.lookup( "implicit-color-fallback" ) ? this.global.scope.lookup( "implicit-color-fallback" ).first.val : false;
            if( oNode.nodeName === "property" && !oNode.expr.isList && bFallbackIsActive ) {
                for( i = -1 ; oExpression = oNode.expr.nodes[ ++i ] ; ) {
                    if( [ "hsla", "rgba" ].indexOf( oExpression.name ) !== -1 ) {
                        oNode.expr.nodes[ i ] = new nodes.Call( "color-fallback", oExpression );
                    }
                }
            }
            _fVisitProperty.call( oEvaluator, oNode );
            return oNode;
        };
    };
};
