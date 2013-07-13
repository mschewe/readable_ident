# -*- encoding : utf-8 -*-
require 'active_record'
require 'active_support/concern'

module ReadableIdent

  module ModelAddition
    extend ActiveSupport::Concern
    include ActiveModel::Validations
    include ActiveModel::MassAssignmentSecurity

    included do
      validates :r_ident, presence: true
      before_validation :generate_readable_ident
      # validates :r_ident, uniqueness: true # TODO
    end

    module ClassMethods
      def readable_ident(params={})
        @params = params
      end
    end

    private
    def generate_readable_ident
      write_attribute(:r_ident, ReadableIdent::generate_readable_ident(@params))
    end

  end
end

ActiveRecord::Base.send(:include, ReadableIdent::ModelAddition)
