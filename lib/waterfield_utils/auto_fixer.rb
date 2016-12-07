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
          columns = association.klass.column_names.map(&:to_sym)
          {
            name: name,
            association_klass: association.klass,
            find_by_field: association.klass.find_by_field,
            asset: columns.include?(:asset_id),
            company_code: columns.include?(:company_code_id),
            company: columns.include?(:company_id),
          }
        end
      end
    end
  end
end
