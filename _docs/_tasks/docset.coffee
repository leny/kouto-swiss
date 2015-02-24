"use strict"

path = require "path"
marked = require "marked"
chalk = require "chalk"
# sqlite3 = require( "sqlite3" ).verbose()
( highlightjs = require "highlight.js" )
    .configure
        classPrefix: ""

pkg = require "../../package.json"

sBundlePath = "./.grunt/docset/kouto_swiss.docset"
sDocsetSourcePath = "./_docs/_docset"
sDocsetPath = "./docset"

oMarkdownCompilationOptions =
    gfm: yes
    tables: true
    highlight: ( sCode ) ->
        highlightjs.highlightAuto( sCode ).value

module.exports = ( grunt ) ->

    return # task is not ready yet.

    grunt.registerTask "docset", "Generate dash docset for Kouto Swiss.", ->
        # 0. Clean previously generated docset folders
        grunt.file.delete "./.grunt/docset"
        grunt.file.delete sDocsetPath
        # 1. Create the docset folders (tmp & final)
        grunt.file.mkdir "#{ sBundlePath }/Contents/Resources/Documents"
        grunt.file.mkdir sDocsetPath
        # 2. Copy the HTML documentation
            # 1. Generate markdown
            # 2. Add stylesheet ?
        # 3. Create the Info.plist File
        grunt.file.copy "#{ sDocsetSourcePath }/Info.plist", "#{ sBundlePath }/Contents/Info.plist"
        # 4. Create the SQLite Index
        db = new sqlite3.Database "#{ sBundlePath }/Contents/Resources/docSet.dsidx"
        db.run "CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);"
        db.run "CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);"
        # 5. Populate the SQLite Index (cf. http://kapeli.com/docsets#fillsqlite)
        db.close()
        # 6. Table of Contents Support (optional)
        # 7. Set an Index Page
        # 8. Add an Icon (inside docset bundle)
        grunt.file.copy "#{ sDocsetSourcePath }/icon.png", "#{ sBundlePath }/icon.png"
        grunt.file.copy "#{ sDocsetSourcePath }/icon@2x.png", "#{ sBundlePath }/icon@2x.png"
        # 9. Generate the archive
        # 10. Copy the archive to the docset's final folder
        # 11. Update version number in docset.json (and copy it)
        # 12. Add an Icon (inside docset final folders)
        grunt.file.copy "#{ sDocsetSourcePath }/icon.png", "#{ sDocsetPath }/icon.png"
        grunt.file.copy "#{ sDocsetSourcePath }/icon@2x.png", "#{ sDocsetPath }/icon@2x.png"
        # 13. Copy README
        grunt.file.copy "#{ sDocsetSourcePath }/README.md", "#{ sDocsetPath }/README.md"
        # 14. Clean temporary files
