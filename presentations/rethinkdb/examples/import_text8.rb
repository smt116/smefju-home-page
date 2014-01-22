# Firstly fun text8.bash

require 'rubygems'
require 'rethinkdb'

include RethinkDB::Shortcuts

r.connect(host: 'localhost', port: 28015).repl

# r.db_drop('text8').run
r.db_create('text8').run rescue nil
db = r.db('text8')
db.table_create('words').run rescue nil

File.open('text8.txt').read.each_line do |word|
  db.table('words').insert({
    word: word.chomp,
    random_number: Random.rand(10**10)
  }).run
end
