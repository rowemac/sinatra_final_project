# Specifications for the Sinatra Assessment
Specs:
- [ ] Use Sinatra to build the app
- [ ] Use ActiveRecord for storing information in a database
    - used active record to create tables for each model class created
- [ ] Include more than one model class (e.g. User, Post, Category) 
    - created User, Library, Book, Friend, and List models
- [ ] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - User class has many libraries and many lists
    - User class has many books through libraries and lists tables
- [ ] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - library belongs to book and user
    - list belongs to book and user
- [ ] Include user accounts with unique login attribute (username or email)
    - all users have a unique username
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    -friends can be added, created, and viewed.
    -lists can be deleted, added, updated, or created.
- [ ] Ensure that users can't modify content created by other users
    -user can view but not edit or add to friends libraries or lists
- [ ] Include user input validations
    -bcrypt gem is used to validate user, then user_id is saved as session id.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    -user is redirected to failure and other pages in case of failed sign up or username of friend not found.
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm
- [ ] You have a large number of small Git commits 
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message