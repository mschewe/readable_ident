# -*- encoding : utf-8 -*-
require 'spec_helper'

root = File.expand_path(File.join(File.dirname(__FILE__), '../..'))
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "#{root}/db/test.db"
)

ActiveRecord::Schema.define do
  self.verbose = false
  create_table :test_classes, :force => true do |t|
    t.string :r_ident
  end
end

class TestClass < ActiveRecord::Base
  readable_ident @options ||= {}
end


# describe ReadableIdent do

#   it 'calls generates a readable_ident at creation' do
#     @options = { length: 10 }
#     test_class = TestClass.create
#     test_class.r_ident.should_not be_empty
#     test_class.r_ident.length.should eq 4
#   end

#   # context 'creation with params' do

#   #   it 'accepts a length param' do
#   #     test_class = TestClass.create
#   #     test_class.r_ident.length.should eq 25
#   #   end

#   #   it 'accepts a prefix param' do
#   #     test_class = TestClass.create
#   #     test_class.r_ident.should start_with('hello')
#   #   end

#   #   it 'acceps a seperator param' do
#   #     test_class = TestClass.create
#   #     test_class.r_ident.should contain('~')
#   #   end

# end