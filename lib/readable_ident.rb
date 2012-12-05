# -*- encoding : utf-8 -*-
require "readable_ident/version"
require "readable_ident/model_additions"
require "readable_ident/railtie" if defined? Rails

module ReadableIdent

  def self.generate(params=nil)
    
    if params and params[:length]
      random = random_alphanumeric(params[:length])
    else
      random = random_alphanumeric()
    end

    random = params[:prefix].to_s + random if params and params[:prefix]
    return random
  end

  private
  def self.random_alphanumeric(size=3)
    s = ""
    size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
    return s
  end

end
