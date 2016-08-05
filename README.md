# project_surveyor
Build it, take it, view it.

[A Ruby on Rails project from the Viking Code School which uses Active Record Associations, nested forms, collection forms, range fields, and PostgreSQL](https://www.vikingcodeschool.com)


A project by Graham and Mike

- User
  - Name - string
- Survey
  - Title - string
  - Description - text
- MultipleChoiceQuestion
   - Title - string
   - Num_choices - boolean
   - Required - boolean
- NumberRangeQuestion
  - Title - string
  - Min - integer
  - Max - integer
  - Required - boolean
- Options
  - Title - string

Relationships
User 1 : Survey *
Survey 1 : MCQ *
MCQ 1 : Options *
Survey 1 : NRQ *
