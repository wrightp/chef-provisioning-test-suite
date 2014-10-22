chef-metal-test-suite
=====================
I don't like the name either.  Throw ideas my way.

## What is this project?
This project is intended to execute all the components that make up the chef-metal ecosystem, and validate they behave as expected.  This includes all the "opscode" chef-metal drivers via chef-zero, Chef Server clusters, or Hosted Chef.  Other facets include OS platorm/versions, including Windows, and cross-platform interaction.

## What does it prove?
This project aims to prove cluster idempotence, and interchangeability between providers and recipes.  Other goals include ensuring key features of chef-metal work as intended e.g., parallel machine creation/convergence, and image creation /loading.

## Concept
chef-metal recipes in this project are small bits of work separted into categories:
* driver
* chef server type
* platform
* tests

Here's an example how tests can be formulated by combining recipes in a certain order.
```
bundle install --binstubs # first things

bundle exec chef-client -z -o chef-metal-driver::vagrant, chef-metal-test::cycle-actions
```
"Hey! That looks just like chef-metal proper!"  And, you would be correct. "So, what gives?"  Well, we are executing standard approaches to running chef-metal and validating that they execute without error.  This work leads to ability to run chef-metal convergence and verify the results with tests.

## The Tests
The tests are pre-configured combinations that will eventually be more dynamic.  Tests will also be easily configured to allow filtering (cli or config api) of what tests should be run for a given execution.
```
rspec spec/vagrant_spec.rb

rspec spec/fog_spec.rb
```
