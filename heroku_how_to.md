$ heroku version
Those using the cloud IDE should see the Heroku version number, indicating that the heroku CLI is available, but on other systems it may be necessary to install it using the Heroku Toolbelt.27

Once you’ve verified that the Heroku command-line interface is installed, use the heroku command to log in and add your SSH key:

$ heroku login
$ heroku keys:add
Finally, use the heroku create command to create a place on the Heroku servers for the sample app to live (Listing 1.15).

Listing 1.15: Creating a new application at Heroku.
$ heroku create
