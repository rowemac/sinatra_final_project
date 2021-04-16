# Specifications for the Sinatra Assessment
Specs:
- [X] Use Sinatra to build the app
    - Utilizes the corneal gem which sets up all files and directories needed to create a project in sinatra. 
    - All of the controllers that handle GET, POST, PATCH, DELETE methods are inherited by the ApplicationController, which inherits from Sinatra::Base

- [X] Use ActiveRecord for storing information in a database
    - In the environment file ActiveRecord::Base establishes a connection to an SQLite3 database. 
    - Uses the 'rake' gem to create migrations that create tables to which data is seeded
    - In turn, every model in app/ inherits from ActiveRecord::Base which grants access to many Object Relational Mapper methods
        - These methods allow creation, readability, updating, and deletion of said data

- [X] Include more than one model class (e.g. User, Post, Category) 
    - There are three model classes: album.rb, user.rb, and library.rb
    - The library model acts as join table between the album and user model

- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - An Album has many libraries and has many users through libraries
    - A User has many libraries and has many albums through libraries

- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - A Library belongs to an album and belongs to a users

- [X] Include user accounts with unique login attribute (username or email)
    - User accounts have a unique login attribute of a username

- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - The LibrariesController contains all seven methods of CRUD including:
        - get '/library'
        - get '/library/new'
        - post '/library'
        - get '/library/:id'
        - get '/library/:id/edit'
        - patch '/library/:id'
        - delete '/library/:id' 

- [ ] Ensure that users can't modify content created by other users
- [X] Include user input validations
    - In the ApplicationController method post '/signup' there is a validation that directs to the failure.erb page if the user does not complete the form with all three fields - email, username, and password.
    - In the ApplicationController method post '/login' a user is found by the parameters of their username; their password is then authenticated through the session and user id.
        - if user enters the correct information they will be redirected to their library; if not, they will encounter a failure page

- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - added flash messages on welcome and signup page for when users do not fill out fields in respective forms
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm
- [X] You have a large number of small Git commits 
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message