### To Dos:
+ create, edit, delete pros/cons
    - Include a nested form writing to an associated model using a custom attribute writer  (form URL, model name e.g. /recipe/new, Item) -- will add to create new list -- nested
    form for pros/cons
    - Include nested resource "new" form (URL e.g. recipes/1/ingredients)

+ suggest cons/pros to other users

+ add more authorization stuffs to views and such
  Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

+ add omni auth via facebook?

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
