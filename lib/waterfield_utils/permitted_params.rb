module WaterfieldUtils
  module PermittedParams
    extend ActiveSupport::Concern

    include do
    end

    module ClassMethods
      def permitted_params
        (reflections.keys + column_names).map(&:to_sym)
      end
    end
  end
end
