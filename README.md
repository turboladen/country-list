Country List
=============

Initially forked from mm1/country-list, but updated to work a little nicer with
Rails 4, bundler, and such.

It provides a generator that will add a new migration file to your migrations folder
This file code will create "countries" table and fill it with countries

This creates a migration that contains a list of countries based on ISO 3166.
Each country row contains:

* short name
* alpha-2 code
* alpha-3 code
* numeric code
