require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'
require 'sqlite3'


require 'bundler/setup'
Bundler.require

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS artists (
  id INTEGER PRIMARY KEY,
  name TEXT,
  genre TEXT,
  age INTEGER,
  hometown TEXT
  )
SQL

ActiveRecord::Base.connection.execute(sql)


# put the code to connect to the database here
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/artists.sqlite"
)


require_relative "../artist.rb"
