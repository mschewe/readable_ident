# -*- encoding : utf-8 -*-
require "readable_ident/model_addition"

module ReadableIdent

  @@regex_prefix    = /[a-zA-Z0-9]+|^$/
  @@regex_seperator = /[~-]+|^$/

  def self.generate_readable_ident(options={})
    options[:length]    ||= 4
    options[:prefix]    ||= ''

    if options[:prefix].empty?
      options[:seperator] ||= ''
    else
      options[:seperator] ||= '-'
    end

    self.validate_options(options)

    options[:prefix].to_s + options[:seperator].to_s + random_alphanumeric(options[:length].to_i).to_s
  end

  private

  def self.random_alphanumeric(length)
    ident = ""
    length.times { ident << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
    return ident
  end

  def self.validate_options(options)
    raise ArgumentError, 'length must be numeric' \
      unless options[:length].is_a? Numeric

    raise ArgumentError, 'seperator length must be 1' \
      unless options[:seperator].length < 2


    raise ArgumentError, 'prefix is not in specified regex' \
      if options[:prefix].match(@@regex_prefix).nil?


    raise ArgumentError, 'seperator is not in specified regex' \
      if @@regex_seperator.match(options[:seperator]).nil?
  end

end