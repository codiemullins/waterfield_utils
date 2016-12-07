module WaterfieldUtils
  module AutoFixer
    extend ActiveSupport::Concern

    include do
    end

    module ClassMethods

      def find_by_field field_name = nil
        @_find_by_field ||= field_name
        return @_find_by_field if @_find_by_field

        [:number, :name, :description].each do |field|
          @_find_by_field = field if @_find_by_field.nil? && column_names.include?(field.to_s)
        end

        @_find_by_field
      end

      def fix_relationships
        reflections.select { |_, r| r.macro == :belongs_to }.map do |name, association|
          WaterfieldUtils::Relationship.new(name, association)
        end
      end
    end
  end
end
