require 'spec_helper'

class TestClass < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  extend ReadableIdent::ModelAdditions
  readable_ident :ident
end

describe ReadableIdent::ModelAdditions do 
  it 'should create a new ident' do
    t = TestClass.create
    t.ident.should not_be_nil
  end

end