
# require_relative 'cohorts_builder'
# require_relative 'dbc_cohorts'
require_relative '../config/environment'

# graduating_cohorts_data = GraduatingCohortsBuilder.run
graduating_cohorts_data = eval(File.read("seeds.txt"))
# p graduating_cohorts_data


  
  # first, all the existing cohorts should be deleted?
  # option 1 - this script is run once automatically 1 week into start
  # getting the new list that may have new or deleted students
  # check to see if there are new students
    # subtract the people (new_list - current_list), any left over should be iterated through and added to the DB
  # check to see if any students have been deleted (current_list - new_list)
    # if deleted, then delete each respective student
  # if you can't find the cohort, then we must be starting a new 

# hold the CRON job to run only on Sunday nights.
# manual running of another file to update cohorts correctly?
  # manual running requires logging in to heroku?

graduating_cohorts_data.each do |cohort_data|
  c = Cohort.where(name: cohort_data[:name]).first_or_initialize

  c.name  ||= cohort_data[:name]
  c.location ||= cohort_data[:location]
  c.save

  cohort_data[:people].each do |person| 
    student = User.where(fullname: person[:name]).first_or_initialize 
    student.cohort_id ||= c.id 
    student.save
    c.users.push(student)
  end
  p c.users

end

