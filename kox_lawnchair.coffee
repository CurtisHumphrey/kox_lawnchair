###
  @author Curtis M. Humphrey, Ph.D.
  
  The files adds a KO extender that ties with Lawnchair
      
  Dependence (from global namespace):
    ko - knockoutjs
    Lawnchair - from https://github.com/brianleroux/lawnchair)=
      
  Public API, Fired Events, or Exports
    options {key: name of key, db_name: name of db}
    
###
define (require) ->
  ko = require 'knockout'
  Lawnchair = require 'lawnchair'
  require 'lawnchair_sqlite'

  ko.extenders.store_locally = (target, options) ->
    unless options.key? then throw "KOX store_locally needs a key specified in its options"
        
    #Save Key on target
    target.key = "" + options.key #make sure it is a string
    
    #Create Lawnchair instance and save on target
    target.lawnchair = new Lawnchair
      name: options.db_name ? false #false cause it to use the default of "records"
    , -> return
    
    #create saving function
    Save_Locally = (new_value) ->
      #console.log "Saving " + target.key + " " + new_value
      target.lawnchair.save
        key: target.key 
        value: new_value
      
    #grab previous value if it exists
    target.lawnchair.exists target.key, (exists) ->
      #console.log target.key + " " + exists
      if exists #replace default value with stored value
        @get target.key, (value) -> target value.value
      else #save with default value
        Save_Locally target()
        
    #setup subscription
    target.subscribe Save_Locally
    
    #return extended observable
    return target
    
    #eof
