
##BootBadge


###Notes
- import users from each cohort from people.devbootcamp.com
- provide users a form to submit potential boot badge slogans
- users can vote badge slogans up/down
- viewer allows an alphabetical review of each boot and thier top slogans

###Contraints
- users do not see themselves
- users can only vote on a slogan up/down once


###Flow
####User
- user page  (direct deep link to the cohort, cohort=xxx-xxxx-2014, etc)
- simple page showing:
    - name
    - photo
    - bootbadge slogans
    - field to add another slogan (max 60 chars?)
    - up/down votes on the existing slogans
    - next boot link
- popup message if vote attempted on slogan already voted on


####Admin
- main admin page - pulldown for all cohorts
- dislay page is the same, allows easy cycling through for live reading



###Basic Steps
1) Setup Schema and Model
	- run bundle
	- create the DB
	- create the migration and model files (w/ rake helpers?)
	- write out the migration
	- run the migration
	- test in the console - can create, read, update?
2) Create the routes
	- create a new route for `get /slogans`
	- create the slogans.erb file to list all slogans
	- show an individual slogan (route and erb file)
	- create a new route for creating slogans
	- create the form for creating a slogan
	- create all routes, views, and forms for all REST routes
	* only `post` requests can have their method overwritten with a hidden field.
3) REMEMBER: the only restful action possible w/ a form is POST
    - you need to use a hidden method to update any data
    - <input type="hidden" name="_method" value="PUT" />
4) TRICK: When you are saving multiple attributes in a form, use a nested hash
	- rack allows you to name a form field name as if it were a hash
	- <input type="hidden" name="slogan[user_id]" value="<%= @slogan.user_id %>" />
5)  


