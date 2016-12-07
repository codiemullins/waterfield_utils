class ApplicationRecord < ActiveRecord::Base
  include WaterfieldUtils::ActsAsWaterfieldUtils

  self.abstract_class = true
end
