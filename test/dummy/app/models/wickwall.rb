class Wickwall < ApplicationRecord
  acts_as_bazinga bazinga_text_field: :last_tweet
end
