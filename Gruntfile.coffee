"use strict"

module.exports = ( grunt ) ->

    grunt.loadNpmTasks "grunt-contrib-clean"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-copy"
    grunt.loadNpmTasks "grunt-contrib-jade"
    grunt.loadNpmTasks "grunt-contrib-stylus"
    grunt.loadNpmTasks "grunt-contrib-connect"
    grunt.loadNpmTasks "grunt-concurrent"
    grunt.loadNpmTasks "grunt-gh-pages"

    grunt.initConfig
        clean:
            docs: [ "docs" ]
        stylus:
            options:
                compress: yes
                use: [
                    require "./lib/kouto-swiss.js" # use internal kouto-swiss
                ]
            docs:
                files:
                    "docs/styles/styles.css": "_docs/_styles/styles.styl"
        jade:
            options:
                compress: yes
            docs:
                options:
                    data: grunt.file.readJSON "package.json"
                files:
                    "docs/docs.html": "_docs/_pages/docs.jade" # TODO : change this
            home:
                options:
                    data: grunt.file.readJSON "package.json"
                files:
                    "docs/index.html": "_docs/_pages/index.jade"
        copy:
            assets:
                expand: yes
                cwd: "_docs/_styles/"
                src: [ "img/**", "fonts/**" ]
                dest: "docs/styles/"
        "gh-pages":
            options:
                base: "docs"
            src: "**/*"
        connect:
            docs:
                options:
                    port: 5555
                    hostname: "*"
                    base: "./docs"
                    keepalive: yes
                    livereload: yes
        concurrent:
            docs:
                tasks: [ "connect:docs", "watch" ]
                options:
                    logConcurrentOutput: yes
        watch:
            options:
                livereload: yes
            jade:
                files: "_docs/_pages/*.jade"
                tasks: [ "jade", "generate" ]
            styles:
                files: "_docs/_styles/**/*.styl"
                tasks: [ "stylus" ]

    grunt.loadTasks "_docs/_tasks"

    grunt.registerTask "default", [
        "clean"
        "jade"
        "generate"
        "stylus"
        "copy"
    ]

    grunt.registerTask "work", [
        "default"
        "concurrent"
    ]

    grunt.registerTask "build", [
        "default"
        "gh-pages"
    ]
