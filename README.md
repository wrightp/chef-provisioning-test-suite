chef-metal-test-suite
=====================
I don't like the name either.  Throw ideas my way.

## What is this project?
This project is intended to execute all the components that make up the chef-metal ecosystem, and validate they behave as expected.  This includes all the "opscode" chef-metal drivers via chef-zero, Chef Server clusters, or Hosted Chef.  Other facets include OS platorm/versions, including Windows, and cross-platform interaction.

## What does it prove?
This project aims to prove cluster idempotence, and interchangability between providers and recipes.  Other goals include ensuring key features of chef-metal work as intended e.g., parallel machine creation/convergence, and image creation /loading.

## Concept
chef-metal recipes in this project are small bits of work separted into categories:
* driver
* chef server type
* platform
* tests

Here's an example how tests can be formulated by combining recipes in a certain order.
```
chef-client -z cookbooks/chef-server-type/recipes/zero.rb cookbooks/chef-metal-driver/recipes/vagrant.rb cookbooks/chef-metal-test/recipes/cycle-actions.rb
```

The tests are pre-configured combinations that will eventually be more dynamic.  Tests will also be easily configured to allow filtering of what tests should be run for a given execution.
```
rspec spec/vagrant_spec.rb

rspec spec/fog_spec.rb
```

## Development
```
bundle install --binstubs
```
