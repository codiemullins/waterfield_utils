class ApplicationRecord < ActiveRecord::Base
  include Bazinga::ActsAsBazinga

  self.abstract_class = true
end
