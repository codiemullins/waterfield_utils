class Wickwall < ApplicationRecord
  acts_as_waterfield_utils waterfield_utils_text_field: :last_tweet
end
