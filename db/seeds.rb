# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MULTIPLIER = 1

puts "Destroying old data"
Survey.destroy_all
User.destroy_all

def create_user
  User.create!(:name => Faker::Pokemon.name)
end

def survey_with_questions
  surv = create_survey
  rand(5).times do
    create_nrq(surv)
  end
  rand(5).times do
    create_mcq(surv)
  end
end

def create_survey
  Survey.create!(:title => Faker::App.name,
                :description => Faker::Hipster.sentence)
end

def create_nrq(survey)
  survey.number_range_questions.create(:title => Faker::Commerce.product_name,
                                    :min => 1, :max => 5,
                                    :required => Faker::Boolean.boolean)
end

def create_mcq(survey)
  question = survey.multiple_choice_questions.create(
                                  :title => Faker::Hacker.say_something_smart,
                                  :multiple_choices => Faker::Boolean.boolean,
                                  :required => Faker::Boolean.boolean)
  (rand(5) + 1).times do
    question.options.create(:title => Faker::Hacker.noun)
  end
end

puts "Creating new surveys"
MULTIPLIER.times do
  create_survey
  5.times do
    survey_with_questions
    create_user
  end
end
puts "Creating new users"
puts "All done!"
