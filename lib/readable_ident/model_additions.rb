# -*- encoding : utf-8 -*-
module ReadableIdent
  module ModelAdditions
    def readable_ident(attribute, params=nil)
      before_validation do
        return unless self.new_record? 
        while true do
          ident = ReadableIdent.generate(params)  
          if self.class.where(attribute.to_sym => ident.to_s).first.nil?
            send("#{attribute}=", ident)
            break
          end
        end

      end
    end
  end
end
