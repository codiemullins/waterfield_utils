class ApplicationRecord < ActiveRecord::Base
  include WaterfieldUtils::ActsAsWaterfieldUtils
  include WaterfieldUtils::AutoFixer

  self.abstract_class = true
end
