class Vote < ActiveRecord::Base

  validates_presence_of :slogan
  validates_presence_of :vote

  belongs_to :slogan
  belongs_to :user

end
