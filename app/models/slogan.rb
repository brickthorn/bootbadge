
class Slogan < ActiveRecord::Base
  # Remember to create a migration!

  validates_presence_of :user_id
  # add validation: if not containing `<script`

  belongs_to :user
  has_many :votes

  def points
    self.votes.sum(:vote) || 0
  end

end
