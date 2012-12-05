# -*- encoding : utf-8 -*-
require 'spec_helper'

  describe "generate_readable_ident" do
    
    context 'with prefix' do
      it 'should contain the prefix' do
        ident = ReadableIdent.generate(prefix: 'custom_prefix_')
        ident.should start_with('custom_prefix_')
      end
    end

    context 'with length' do
      it 'should generate ident with given length' do
        ident = ReadableIdent.generate(length: 22)
        ident.length.should eq 22
      end
    end

    context 'no parameters' do
      it 'should generate ident with length 3' do
          ident = ReadableIdent.generate()
          ident.length.should eq 3
      end
    end
  end
