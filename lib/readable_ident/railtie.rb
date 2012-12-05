# -*- encoding : utf-8 -*-
module ReadableIdent
  class Railtie < Rails::Railtie
    initializer 'readable_ident.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end
