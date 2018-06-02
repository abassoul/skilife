class Mountain < ApplicationRecord
  mount_uploader :route_photo, RoutePhotoUploader

  # Direct associations

  belongs_to :skier,
             :counter_cache => :mountain_photos_count

  # Indirect associations

  # Validations

end
