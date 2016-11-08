### To Dos:
+ finish specs first

+ (later) in order to allow granting edit permissions to any user we'll need a join table between
  list and user -- permssions table? and remove the admin column from starrer so that the user doesn't have to start the list


+ what's up with the starring your own?

+ change pro_con name to item_type "pro", "con"
  ?

x + create, edit, delete pros/cons

x + suggest cons/pros to other users (see above)

+ add more authorization stuffs to views and such (ish?)
  Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

x + add omni auth via facebook?

+ scrape onion

x 1. Users must create an account
x 2. Users can sign in.
x 3. Users can change password via email reset.
x 4. User can edit profile.
x 5. Once signed in, users can create, edit, or delete lists.
x 6. Users can also view other users' lists and add pros and cons to their lists.
7. Users can "friend" other users. (will not implement)
x 8. Users can star other users' lists.
9. Users can delete their account.
10. Users can sign up via FB, Instagram, Github?


________________________________________
### Database Planning -- Initial -- DONE

# User
  + sample app
  + roll out on own -- maybe add devise at end?
  + name
  + email

# Lists
  + title
  + description


# Pro/Cons - Use Item model instead of overlapping models.
  + mirror active_relationship, passive_relationship renaming conventions
