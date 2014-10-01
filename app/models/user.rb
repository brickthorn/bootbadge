class User < ActiveRecord::Base

  has_many :slogans
  belongs_to :cohort

  def sorted_cohort_members
    self.cohort.users.sort_by {|user| user.fullname }
  end

  def previous_id
    cohort_students = sorted_cohort_members
    current_index = cohort_students.index(self)
    (cohort_students[current_index - 1] || cohort_students.last).id
  end

  def next_id
    cohort_students = sorted_cohort_members
    current_index = cohort_students.index(self)
    (cohort_students[current_index + 1] || cohort_students.first).id
  end

end

