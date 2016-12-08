class Asset < ApplicationRecord

  belongs_to :company_code
  has_many :meters
end
