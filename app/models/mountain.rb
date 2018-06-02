class Mountain < ApplicationRecord
  # Direct associations

  belongs_to :skier,
             :counter_cache => :mountain_photos_count

  # Indirect associations

  # Validations

end
