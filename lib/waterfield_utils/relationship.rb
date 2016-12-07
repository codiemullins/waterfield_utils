module WaterfieldUtils
  class Relationship
    attr_accessor :name, :association, :klass

    def initialize name, association
      @name = name
      @association = association
      @klass = association.klass
    end

    def columns
      @_columns ||= association.klass.column_names.map(&:to_sym)
    end

    def find_by_field
      klass.find_by_field
    end

    def asset?
      columns.include?(:asset_id)
    end

    def company_code?
      columns.include?(:company_code_id)
    end

    def company?
      columns.include?(:company_id)
    end
  end
end
