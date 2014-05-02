require_relative '../config/environment'

SKIPPERS_NAMES = ["Alexandra Swart",
                  "Andrew Roberts",
                  "Ashwin Kumar",
                  "Bo Phane Keopaseut",
                  "Brittan McGinnis",
                  "Charles Raymond Arciniega",
                  "Darrell Sommerlatt",
                  "David Wilbanks",
                  "Erin Snyder",
                  "Greg Gerla",
                  "Hemchandra Inamdar",
                  "Jackson Behan",
                  "Jonathan Wrobel",
                  "Kelley Puckett",
                  "Laura Cossette",
                  "Lyndsey Williams",
                  "Matt Lewis",
                  "Namrata Honnavar",
                  "Nathan Sass",
                  "Nina Hwang",
                  "Paolo Payumo",
                  "Ravi S. Ramphal",
                  "Rodrigo Manubens",
                  "Tyler Stauss"]

COHORT = "Fiery Skippers"

SKIPPERS_NAMES.each do |name|
  User.create(fullname: name, cohort_id: 1) 
end

