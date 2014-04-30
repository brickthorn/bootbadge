class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :slogans
  belongs_to :cohort

  def previous
    self.class.order("id DESC").where("id < ?", self.id).first || self.class.last
  end

  def next
    self.class.order("id ASC").where("id > ?", self.id).first || self.class.first
  end

end
