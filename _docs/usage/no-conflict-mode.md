# *no conflict* mode & mixins aliases

If you use **kouto-swiss** with other mixins libraries, some variables & mixins names colisions can happens.

To avoid that problem, all the functions & mixins of **kouto-swiss** are also available with the `ks-` prefix before their name.

You should include the **kouto-swiss** lib first in your stylesheets, before any other library.

## *no-conflict* mode

You can also use the *no-conflict* mode : this will disable all the *public* or potentially conflicting variables & mixins name used by **kouto-swiss**, letting only the `ks-` prefixed variables & mixins availables.

To use the *no-conflict* mode, simple set the `ks-no-conflict` variable to `true` **before** including **kouto-swiss**.

```stylus
ks-no-conflict = true
@import "kouto-swiss"
```
