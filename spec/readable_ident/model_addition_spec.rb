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
  readable_ident length: 10
end


describe ReadableIdent do

  let(:test_class) { TestClass.create() }

  it 'calls generates a readable_ident before validation' do
    test_class.r_ident.should_not be_nil
    test_class.r_ident.should_not be_empty
    test_class.r_ident.length.should be 10
  end

  context 'creation with options' do

    it 'accepts a length option' do
      TestClass.options.merge!({length: 11})
      test_class.r_ident.length.should be 11
    end

    it 'accepts a prefix option' do
      TestClass.options.merge!({prefix: 'x', length: 12, seperator: '~'})
      test_class.r_ident.length.should be 14
      test_class.r_ident.should start_with('x~')
    end

    it 'acceps a seperator option' do
      TestClass.options.merge!({prefix: 'y', length: 13, seperator: ''})
      test_class.r_ident.length.should be 14
      test_class.r_ident.should start_with('y')
    end
  end

  context 'model validations' do
    it 'generates unique idents' do
      test_class_1 = FactoryGirl.build(:test_class)
      test_class_2 = FactoryGirl.build(:test_class, r_ident: test_class_1.r_ident)

      test_class_1.should be_valid
      test_class_2.should be_valid

      test_class_1.r_ident.should_not be test_class_2.r_ident

    end

    it 'p_ident should not be nil' do
      test_class.r_ident = nil
      test_class.should_not be_valid
    end

    it 'check if p_ident is empty' do
      test_class.r_ident = ''
      test_class.should_not be_valid
    end
  end

end
