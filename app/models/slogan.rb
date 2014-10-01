
class Slogan < ActiveRecord::Base

  validates_presence_of :user_id
  validates_presence_of :content
  validates :content, format: { without: /<script>/,
                                message: "no javascript injection attacks allowed" }

  belongs_to :user
  has_many :votes

  def points
    self.votes.sum(:vote) || 0
  end

end
