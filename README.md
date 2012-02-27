Introduction
============

Simple library that handles the conversion of Postgres HStores to and from Ruby Hashes.  There is also a serializer that can be used in ActiveRecord models for storing unstructured data.

Installation
------------

Create the HStore extension in your Postgres database:

    create extension hstore;

Add the following to your `Gemfile`:

    gem 'hstore_serializer', :git => 'git://github.com/robertsosinski/hstore_serializer.git', :ref => 'v0.1.0'
    
Where `ref` can be the version of your choosing.

Independent Usage
-----------------

    # Hash to HStore
    {:a => 'apple', :b => 'banana bread', :fruit => true}.to_hstore
    => 'a=>apple,fruit=>true,b=>"banana bread"'
    
    # HStore to Hash
    'a=>apple,fruit=>true,b=>"banana bread"'.from_hstore
    => {"a"=>"apple", "b"=>"banana bread", "fruit"=>"true"}
    
NOTE: Keep in mind that HStore keys and values are always typecasted as text in Postgres, and can only be one-dimensional.

Using With ActiveRecord
-----------------------

    class Basket < ActiveRecord::Base
      serialize :fruits, HstoreSerializer
    end
    
    # Create a new record
    basket = Basket.create(:fruits => {:a => "apple", :b => "banana bread"})
    
    # Find records with the key "a"
    Basket.where("fruits ? 'a'")
    
    # Find records where the key "a" is equal to "apple"
    Basket.where("fruits -> 'a' = ?", "apple")
    
    # Updating HStore values
    basket.fruits["a"] = "apricot"
    basket.save

NOTE: You can find more HStore query operators at http://www.postgresql.org/docs/9.1/static/hstore.html#HSTORE-OP-TABLE

Credits
-------

The important parts of this library were pulled from http://github.com/softa/activerecord-postgres-hstore, and the idea to use a serializer came from http://github.com/ruckus/active_record_hstore_serializer.

The main driver of this library was to make a light weight and well tested library without any dependencies on ActiveRecord or ActiveSupport.