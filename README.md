# Project name
## Hospital control

# Project Description
Hospital Control is a web application that allows you to register
a doctor and a patient. Create patient visits to the doctor, 
the doctor can write out recommendations. The application was 
created using the Ruby on Rails framework version 7.0.4 and the 
Ruby programming language version 3.1.2.

# Main features
- Create and edit a patient
- Create, edit a doctor
- Ability to make an appointment
- Ability to make a recommendation to a doctor

# Installation instructions
Download the repository with the application to your computer
[repo](git@github.com:VladFomenko/hospital_control.git)
Install Ruby version 3.1.2 and Rails version 7.0.4.
Install all necessary dependencies by running```bundle install``` command.
Create a database by running the commands```rails db:create``` and ```rails db:migrate```.
Start the server by running the rails server command. Also you need to create .env in config directory(rename .env_example)

# Use of technology
- ruby 3.0.3
- rails 7.0.4
- devise
- administer
- cancancan
- amazon s3
- Rspec
- Capybara
- Bootstrap