"use strict"

path = require "path"
cheerio = require "cheerio"
chalk = require "chalk"
( oRenderer = new ( marked = require "marked" ).Renderer() )
    .heading = ( sText, iLevel ) ->
        "<h#{ iLevel }>#{ sText }</h#{ iLevel }>"

( highlightjs = require "highlight.js" )
    .configure
        classPrefix: ""

pkg = require "../../package.json"
index = require "../index.json"

oMarkdownCompilationOptions =
    gfm: yes
    tables: true
    renderer: oRenderer
    highlight: ( sCode ) ->
        highlightjs.highlightAuto( sCode ).value

module.exports = ( grunt ) ->

    grunt.registerTask "generate", "Generate Kouto Swiss documentation page.", ->
        sDocFilePath = "docs/docs.html"
        oDocChapters = {}
        iChapters = index.chapters.length
        iTopics = 0
        # 1. get all the markdown doc files
        grunt.file.recurse "./_docs", ( sAbsolutePath, sRootDir, sSubDir, sFilename ) ->
            return if sAbsolutePath[6] is "_" or ( sExt = path.extname( sFilename ) ) isnt ".md" # exclude non-doc
            oDocChapters[ sSubDir ] ?= {}
            sTopicName = sFilename.replace sExt, ""
            sFileContent = grunt.file.read sAbsolutePath
            sParsedContent = marked sFileContent, oMarkdownCompilationOptions
            oDocChapters[ sSubDir ][ sTopicName ] = sParsedContent
        sDocPageFileContent = grunt.file.read sDocFilePath
        $ = cheerio.load sDocPageFileContent

        # 2. generate navigation menu
        ( $menu = $ "#wrapper header nav > ul" ).empty()
        for sChapterName in index.chapters
            ( $chapterNav = $ "<li><strong></strong><ul></ul></li>" )
                .find( "strong" )
                    .text( sChapterName.toLowerCase() )
            $chapterTopicsNav = $chapterNav.find "ul"
            for sTopicName in index[ sChapterName ]
                iTopics++
                ( $topicNavLink = $ "<li><a></a></li>" )
                    .find( "a" )
                        .attr( "href", "##{ sTopicName }" )
                        .text( sTopicName )
                $chapterTopicsNav.append $topicNavLink
            $menu.append $chapterNav

        # 3. insert doc articles
        ( $docs = $ "#wrapper div.docs" ).empty()
        for sChapterName in index.chapters
            ( $chapterTitle = $ "<h2></h2>" ).text sChapterName
            $docs.append $chapterTitle
            for sTopicName in index[ sChapterName ]
                ( $topicArticle = $ "<article></article>" )
                    .attr( "id", sTopicName )
                    .html( oDocChapters[ sChapterName ][ sTopicName ] )
                $docs.append $topicArticle

        # 4. update version number
        $( "#wrapper .about p strong.version" ).text "v#{ pkg.version }"
        $( "#wrapper .about p strong.stylus" ).text "v#{ pkg.dependencies.stylus }"

        # 5. save
        grunt.file.write sDocFilePath, $.html()

        # 6. log
        grunt.log.writeln "Generate doc for #{ chalk.cyan( iTopics ) } topics in #{ chalk.cyan( iChapters ) } chapters into #{ chalk.cyan( sDocFilePath ) }"
