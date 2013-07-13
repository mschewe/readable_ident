# -*- encoding : utf-8 -*-
require 'active_record'
require 'active_support/concern'

module ReadableIdent

  module ModelAddition
    extend ActiveSupport::Concern
    include ActiveModel::Validations

    @options

    included do
      validates :r_ident, presence: true, length: { minimum: 0 }
      after_validation :generate_readable_ident
    end

    module ClassMethods
      def readable_ident(options={})
        attr_reader :options
        class_attribute :options
        self.options = options
      end
    end

    private
    def generate_readable_ident
      r_ident = ''
      while true do
        r_ident = ReadableIdent::generate_readable_ident(self.options)
        break if self.class.where(r_ident: r_ident).first.nil?
      end
      write_attribute(:r_ident, r_ident)
    end

  end
end

ActiveRecord::Base.send(:include, ReadableIdent::ModelAddition)
