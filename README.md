chef-metal-test-suite
=====================
I don't like the name either.

```
cd spec/cookbooks

CHEF_DRIVER=vagrant chef-client -z chef-server-type/recipes/zero.rb chef-metal-driver/recipes/vagrant.rb chef-metal-test/recipes/cycle-actions.rb
```
