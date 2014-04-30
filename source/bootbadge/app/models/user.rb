class User < ActiveRecord::Base

  # Remember to create a migration!
  has_many :slogans
  belongs_to :cohort


# create an array of users
# find out the current index
# return the ID of the next element in the array

  def previous_id
    cohort_students = self.cohort.users
    current_index = cohort_students.index(self)
    (cohort_students[current_index - 1] || self.class.last).id
  end

  def next_id
    cohort_students = self.cohort.users
    current_index = cohort_students.index(self)
    (cohort_students[current_index + 1] || self.class.first).id
  end

end

