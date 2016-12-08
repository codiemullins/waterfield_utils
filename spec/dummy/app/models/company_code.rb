class CompanyCode < ApplicationRecord
  
  has_many :meters
  has_many :assets

  find_by_field :name
end
