# KOX_Lawnchair

KOX_Lawnchair is a [knockout.js](http://knockoutjs.com/) [custom extender](http://knockoutjs.com/documentation/extenders.html) that allow an easy way to added [Lawnchair](http://brian.io/lawnchair/) based local storage of observable data.

# Requirements
- Knockoutjs
- requirejs
- lawnchair
- lawnchair_sqlite (adaptor)

# How do I use it?
add lawnchair and lawnchair_sqlite to your require paths
```coffeescript
## in coffeescript
lawnchair: "path_to/kox_lawnchair/lawnchair"
lawnchair_sqlite: "path_to/kox_lawnchair/adapters/webkit-sqlite"
kox_lawnchair: "path_to/kox_lawnchair/kox_lawnchair"

shim:
  'lawnchair':
    exports: 'Lawnchair'
  'lawnchair_sqlite':
    deps: ['lawnchair']
    exports: 'Lawnchair'
```

use in your knockout view models like:
### CoffeeScript
```coffeescript
## in coffeescript

data = ko.observable 40
  .extend
    store_locally:
      key: "key_name" #this key is required and must be globally unique to be uniquely stored
      db_name: "database_name" #this key is optional
```

### Javascript
```javascript
// in javascript
var data = ko.observable(40).extend({
  store_locally: {
    key: "key_name",
    db_name: "database_name"
  }
});
```

# License
KOX_Morf is Copyright © 2014 Curtis M. Humphrey and is licensed under the terms of the MIT License.
