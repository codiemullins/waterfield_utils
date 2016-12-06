module Bazinga
  module ActsAsBazinga
    extend ActiveSupport::Concern

    include do
    end

    module ClassMethods
      def acts_as_bazinga(options = {})
        cattr_accessor :bazinga_text_field

        self.bazinga_text_field = (options[:bazinga_text_field] || :last_squawk).to_s

        include Bazinga::ActsAsBazinga::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def squawk(string)
        write_attribute(self.class.bazinga_text_field, string.to_squawk)
      end
    end
  end
end
