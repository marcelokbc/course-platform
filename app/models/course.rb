class Course < ApplicationRecord
  has_many :videos, dependent: :destroy
end
