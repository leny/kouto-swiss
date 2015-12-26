// kouto-swiss gruntfile

"use strict";

module.exports = function( grunt ) {

    require( "load-grunt-tasks" )( grunt );
    grunt.loadTasks( "_docs/_tasks" );

    grunt.initConfig( {
        "mochacli": {
            "options": {
                "require": [ "should" ],
                "reporter": "spec",
                "inline-diffs": true
            },
            "tests": {
                "src": "test/runner.js"
            }
        },
        "clean": {
            "docs": [ "docs" ]
        },
        "stylus": {
            "options": {
                "compress": true,
                "use": [ require( "./lib/kouto-swiss.js" ) ]
            },
            "docs": {
                "files": {
                    "docs/styles/styles.css": "_docs/_styles/styles.styl"
                }
            }
        },
        "jade": {
            "options": {
                "compress": true
            },
            "docs": {
                "options": {
                    "data": grunt.file.readJSON( "package.json" )
                },
                "files": {
                    "docs/docs.html": "_docs/_pages/docs.jade"
                }
            },
            "home": {
                "options": {
                    "data": grunt.file.readJSON( "package.json" )
                },
                "files": {
                    "docs/index.html": "_docs/_pages/index.jade"
                }
            }
        },
        "copy": {
            "assets": {
                "expand": true,
                "cwd": "_docs/_styles/",
                "src": [ "img/**", "fonts/**" ],
                "dest": "docs/styles/"
            },
            "scripts": {
                "expand": true,
                "cwd": "_docs/_js/",
                "src": [ "**" ],
                "dest": "docs/js/"
            },
            "cname": {
                "src": "_docs/CNAME",
                "dest": "docs/CNAME"
            },
            "readme": {
                "src": "_docs/README.md",
                "dest": "docs/README.md"
            }
        },
        "gh-pages": {
            "options": {
                "base": "docs"
            },
            "src": "**/*"
        },
        "connect": {
            "docs": {
                "options": {
                    "port": 5555,
                    "hostname": "*",
                    "base": "./docs",
                    "keepalive": true,
                    "livereload": true
                }
            }
        },
        "concurrent": {
            "docs": {
                "tasks": [ "connect:docs", "watch" ],
                "options": {
                    "logConcurrentOutput": true
                }
            }
        },
        "watch": {
            "options": {
                "livereload": true
            },
            "jade": {
                "files": "_docs/_pages/*.jade",
                "tasks": [ "jade", "generate" ]
            },
            "styles": {
                "files": "_docs/_styles/**/*.styl",
                "tasks": [ "stylus" ]
            },
            "scripts": {
                "files": "_docs/_js/**/*.js",
                "tasks": [ "copy:scripts" ]
            },
            "docs": {
                "files": "_docs/**/*.md",
                "tasks": [ "generate" ]
            }
        }
    } );

    grunt.registerTask( "default", [
        "clean",
        "jade",
        "generate",
        "stylus",
        "copy"
    ] );

    grunt.registerTask( "test", [
        "mochacli"
    ] );

    grunt.registerTask( "preview", [
        "default",
        "connect:docs"
    ] );

    grunt.registerTask( "work", [
        "default",
        "concurrent"
    ] );

    grunt.registerTask( "build", [
        "default",
        "gh-pages"
    ] );
};
