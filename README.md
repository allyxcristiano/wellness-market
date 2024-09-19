# README

This is the initial basic implementation of a wellness marketplace.
Initially, we're focusing on designing the core entities based on some requirements.
Because of this, the README is simple and will primarily guide you on how to seeding the database and run specs.

# Ruby version

`3.2.4`

It's recommended to use a version manager to easily switch Ruby versions.
Popular options include [ASDF](https://asdf-vm.com/guide/introduction.html) and [rbenv](https://github.com/rbenv/rbenv). You can check the links for instructions on setting up this version locally.

After installing Ruby, you can install the necessary gems by running `bundle install`.
Some additional dependencies might be required; follow any instructions based on the messages you receive.

# Database creation
  
Once Ruby and the project dependencies are installed, run `rails db:migrate` to set up the database.

# Database initialization

To seed the database with some test data, run `rails db:seed`.
If you need to recreate the database from scratch, you can do so with `rails db:reset`.

# How to run the test suite

To run all tests, execute `rspec`.
