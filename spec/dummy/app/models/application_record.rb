class ApplicationRecord < ActiveRecord::Base
  include WaterfieldUtils::PermittedParams
  include WaterfieldUtils::AutoFixer

  self.abstract_class = true
end
