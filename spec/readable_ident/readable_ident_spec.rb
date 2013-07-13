# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "generate_readable_ident" do

  context 'prefix' do

    it 'should be empty if not supplied' do
      ident = ReadableIdent.generate_readable_ident(length: 10);
      ident.length.should eq 10
      ident.should_not start_with('-')
    end

    it 'must be in specified regex' do
      expect { ReadableIdent.generate_readable_ident(prefix: 'ß') }.to \
        raise_error(ArgumentError, 'prefix is not in specified regex')
    end

    it 'should start with the given prefix' do
      ident = ReadableIdent.generate_readable_ident(prefix: 'custom_prefix')
      ident.should start_with('custom_prefix')
    end
  end

  context 'seperator' do

    it 'should have a dash as seperator if prefix is specified' do
      ident = ReadableIdent.generate_readable_ident(prefix: 'hello')
      ident.should start_with('hello-')
    end

    it 'should have an empty seperator if specified and has prefix' do
      ident = ReadableIdent.generate_readable_ident(prefix: 'hello', seperator: '', length: 10)
      ident.should =~ /hello[a-zA-Z0-9]{10}/
    end

    it 'must have the length of 1' do
      expect { ReadableIdent.generate_readable_ident(seperator: '123') }.to \
        raise_error(ArgumentError, 'seperator length must be 1')
    end

    it 'must be in specified regex' do
      expect { ReadableIdent.generate_readable_ident(seperator: "µ") }.to \
        raise_error(ArgumentError, 'seperator is not in specified regex')
    end

    it 'should have use the supplied seperator' do
      ident = ReadableIdent.generate_readable_ident(seperator: '~')
      ident.should start_with('~')
    end

  end

  context 'length' do

    it 'should generate ident with given length' do
      ident = ReadableIdent.generate_readable_ident(length: 22)
      ident.length.should eq 22
    end

    it 'must be numeric or raise AgrumentError' do
      expect { ReadableIdent.generate_readable_ident(length: 'a') }.to \
        raise_error(ArgumentError, 'length must be numeric')
    end

    it 'should have a length of 4 if no length given' do
      ident = ReadableIdent.generate_readable_ident
      ident.length.should eq 4
    end
  end

end
