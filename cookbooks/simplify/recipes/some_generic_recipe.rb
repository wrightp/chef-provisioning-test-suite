


# this recipe will be dependent on a driver recipe
# which will overrride the recipe attributes.

# there may be instances where these recipes contain
# condition logic in order to support driver specific
# alterations. 

machine node['default-name'] do
  machine_options node['default-empty-hash']
  run_list node['default-run-list'] # use over recipe so we don't have to worry about a dynamic recipe attribute arity
end
