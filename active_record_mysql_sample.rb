# samples_schema.sql
# CREATE DATABASE samples;
# USE samples;

# CREATE TABLE samples ( id int(11) NOT NULL AUTO INCREMENT, name TEXT, wins int(11) NOT NULL, salary DECIMAL(9, 2), PRIMARY KEY(id) )

# mysql -u sql_username -p < samples_schema.sql
require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => 'mysql', :host => 'localhost', :username => '', :password => '' :database => 'samples')

class Sample < ActiveRecord::Base
end
# (q->rear+1) % MAX == front

Sample.delete_all
