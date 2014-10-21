chef-metal-test-suite
=====================
I don't like the name either.


```
chef-client -z cookbooks/chef-server-type/recipes/zero.rb cookbooks/chef-metal-driver/recipes/vagrant.rb cookbooks/chef-metal-test/recipes/cycle-actions.rb
```

```
rspec spec/vagrant_spec.rb

rspec spec/fog_spec.rb
```
