Country List
=============

Initially forked from mm1/country-list, but updated to work a little nicer with
Rails 4, bundler, and such.

It provides a generator that will create:

* a migration to create the countries table
* the Country model
* db/seed_countries.rb, which has the code for seeding the country data
* lib/tasks/seed_countries.rake, which runs the code in db/seed_countries.rb

The migration contains a list of countries based on ISO 3166. Each country row
contains:

* short name
* alpha-2 code
* alpha-3 code
* numeric code
