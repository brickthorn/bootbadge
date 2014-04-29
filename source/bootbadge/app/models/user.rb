class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :slogans
  belongs_to :cohort
end
