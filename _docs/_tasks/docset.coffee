"use strict"

path = require "path"
marked = require "marked"
chalk = require "chalk"
( highlightjs = require "highlight.js" )
    .configure
        classPrefix: ""

pkg = require "../../package.json"

oMarkdownCompilationOptions =
    gfm: yes
    tables: true
    highlight: ( sCode ) ->
        highlightjs.highlightAuto( sCode ).value

module.exports = ( grunt ) ->

    grunt.registerTask "docset", "Generate dash docset for Kouto Swiss.", ->
        # 1. Create the docset folders (tmp & final)
        # 2. Copy the HTML documentation
            # 1. Generate markdown
            # 2. Add stylesheet ?
        # 3. Create the Info.plist File
        # 4. Create the SQLite Index
        # 5. Populate the SQLite Index
        # 6. Table of Contents Support
        # 7. Set an Index Page
        # 8. Add an Icon
        # 9. Generate the archive
        # 10. Copy the archive to the docset's final folder
        # 11. Update version number in docset.json
        # 12. Clean temporary files
