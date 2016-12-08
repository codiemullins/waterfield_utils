module WaterfieldUtils
  class Fixer
    attr_accessor :params, :root, :child

    def initialize params, root, child = nil
      @params = params.clone
      @root = root
      @child = child || root
    end

    def call
      relationships.each do |relationship|
        # Variables used within this block frequently
        name = relationship.name
        find_by_field = relationship.find_by_field

        # Get restriction level
        restriction_level = [:asset, :company_code, :company].find do |level|
          relationship.send("#{level}?".to_sym) && root.respond_to?(level)
        end

        # If restriction level found create base_scope hash
        if restriction_level
          root_field_id = "#{restriction_level}_id"
          root_id = root.send root_field_id
          base_scope = {"#{root_field_id}".to_sym => root_id}
        else
          base_scope = {}
        end

        # Set association_scope, used when finding association below
        assocation_scope = relationship.klass.where(base_scope)

        if params.key? "#{name}_#{find_by_field}".to_sym
          params[name] = assocation_scope.send("find_by_#{find_by_field}".to_sym, params["#{name}_#{find_by_field}".to_sym])
        elsif params.key?(name) && params[name].is_a?(Hash)
          params[name] = assocation_scope.send("find_by_#{find_by_field}".to_sym, params[name][find_by_field])
        end

        if params[name].nil? && params.key?("#{name}_id".to_sym)
          params[name] = assocation_scope.find_by_id params["#{name}_id".to_sym]
        end


        # Relationship may end up as empty string, set to nil
        params[name] = nil if params[name] == ""

        # params = params.except("#{name}_id".to_sym)
        # raise params.except(:asset).inspect
      end

      # raise [params, child.class.permitted_params, params.slice(*child.class.permitted_params)].inspect

      params.slice *child.class.permitted_params
    end

    def relationships
      @_relationships = child.class.fix_relationships
    end
  end
end
