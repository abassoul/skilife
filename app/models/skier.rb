class Skier < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :mountain_photos,
             :class_name => "Mountain",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
