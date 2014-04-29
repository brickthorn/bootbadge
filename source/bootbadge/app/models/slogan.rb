
class Slogan < ActiveRecord::Base
  # Remember to create a migration!

  validates_presence_of :user_id

  belongs_to :user
  has_many :votes

  def points
    self.votes.map(&:vote).inject(&:+) || 0
  end

end
