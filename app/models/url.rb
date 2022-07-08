class Url < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :long_url
  validates_format_of :long_url, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  belongs_to :user

end
