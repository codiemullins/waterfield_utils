module WaterfieldUtils
  module ActsAsWaterfieldUtils
    extend ActiveSupport::Concern

    include do
    end

    module ClassMethods
      def acts_as_waterfield_utils(options = {})
        cattr_accessor :waterfield_utils_text_field

        self.waterfield_utils_text_field = (options[:waterfield_utils_text_field] || :last_squawk).to_s

        include WaterfieldUtils::ActsAsWaterfieldUtils::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def squawk(string)
        write_attribute(self.class.waterfield_utils_text_field, string.to_squawk)
      end
    end
  end
end
