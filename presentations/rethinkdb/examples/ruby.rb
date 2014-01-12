require 'rubygems'
require 'rethinkdb'

include RethinkDB::Shortcuts

r.connect(host: 'localhost', port: 28015).repl
db = r.db('test')
db.table_create('students').run rescue nil
db.table('students').insert({
  name:   'Maciek',
  index:  194930
}).run

db.table('students').run.each do |student|
  puts "[#{student['id']}] #{student['name']} (#{student['index']})"
end
