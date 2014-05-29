"use strict"

module.exports = ( grunt ) ->

    grunt.loadNpmTasks "grunt-contrib-clean"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-copy"
    grunt.loadNpmTasks "grunt-contrib-jade"
    grunt.loadNpmTasks "grunt-ks-stylus"

    grunt.initConfig
        clean:
            docs: [ "docs" ]
        stylus:
            options:
                compress: yes
            docs:
                files:
                    "docs/styles/styles.css": "_docs/_styles/styles.styl"
        jade:
            options:
                compress: yes
            docs:
                options:
                    data: # TMP
                        name: "demo test"
                        id: "test"
                        doc: "<p>here's <strong>the docs</strong> !</p>"
                        demo: "<p>here's <em>the demo</em> !</p>"
                files:
                    "docs/demo.html": "_docs/_pages/demo.jade" # TODO : change this
            home:
                options:
                    data: # TMP
                        name: "demo test"
                        id: "test"
                        doc: "<p>here's <strong>the docs</strong> !</p>"
                        demo: "<p>here's <em>the demo</em> !</p>"
                files:
                    "docs/index.html": "_docs/_pages/index.jade" # TODO : change this
        copy:
            assets:
                expand: yes
                cwd: "_docs/_styles/"
                src: [ "img/**", "fonts/**" ]
                dest: "docs/styles/"
        watch:
            jade:
                files: "_docs/_pages/*.jade"
                tasks: [ "jade" ]
            styles:
                files: "_docs/_styles/**/*.styl"
                tasks: [ "stylus" ]

    # TODO : change this, default task should build the docs & demo
    grunt.registerTask "default", [
        "clean"
        "jade"
        "stylus"
        "copy"
    ]

    grunt.registerTask "work", [
        "default"
        "watch"
    ]
