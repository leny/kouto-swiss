# Using with PHPStorm and WebStorm IDEs

On some IDEs like PHPStorm and Webstorm, you can automatically compile your styles as they change, without relying on a third-party tool.  In PHPStorm and Webstorm, this functionality is known as *file watchers*.  To use with PHPStorm or WebStorm, as a file watcher, simply:

1. Ensure you have added ``kouto-swiss`` as a dependency: ```bash
$ npm install --save-dev kouto-swiss
```
2. Do an ``npm install``
3. Create a new file watcher with settings like these: [![webstorm-integration](styles/img/webstorm-integration.png)](styles/img/webstorm-integration.png)
4. Create an ``@import`` in one of you ``.styl`` files:
```
@import "../../../node_modules/kouto-swiss" // import kouto-swiss for auto-prefixing (or whatever relative path where node-modules lives
```
