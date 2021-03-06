## Resource Trail
+ Everytime I think I'm getting this weird rare error, GOOGLE TO THE RESCUE: https://github.com/ffi/ffi/issues/447.
https://github.com/rowland/activerecord-fb-adapter/issues/61

http://stackoverflow.com/questions/10218587/twitter-bootstrap-drop-down-suddenly-not-working


NOPE.

+ background image deploy issue: https://devcenter.heroku.com/articles/rails-asset-pipeline
+ cool background images: http://subtlepatterns.com/
+ kill existing server: http://stackoverflow.com/questions/4473229/rails-server-says-port-already-used-how-to-kill-that-process
+ http://stackoverflow.com/questions/31039998/address-already-in-use-bind2-errnoeaddrinuse
+ used chp 3 to 14: [*Ruby on Rails Tutorial*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/)
+ http://www.theodinproject.com/ruby-on-rails
+ https://www.jitbit.com/alexblog/256-targetblank---the-most-underestimated-vulnerability-ever/

+ add remember me feature with token and digest -- that way if user closes browser
  they can stay logged in


Box 6.2. Database indices
When creating a column in a database, it is important to consider whether we will need to find records by that column. Consider, for example, the email attribute created by the migration in Listing 6.2. When we allow users to log in to the sample app starting in Chapter 7, we will need to find the user record corresponding to the submitted email address. Unfortunately, based on the naïve data model, the only way to find a user by email address is to look through each user row in the database and compare its email attribute to the given email—which means we might have to examine every row (since the user could be the last one in the database). This is known in the database business as a full-table scan, and for a real site with thousands of users it is a Bad Thing.
Putting an index on the email column fixes the problem. To understand a database index, it’s helpful to consider the analogy of a book index. In a book, to find all the occurrences of a given string, say “foobar”, you would have to scan each page for “foobar”—the paper version of a full-table scan. With a book index, on the other hand, you can just look up “foobar” in the index to see all the pages containing “foobar”. A database index works essentially the same way.



-- IE shim --
Let’s look at the new elements in Listing 5.1 from top to bottom. As alluded to briefly in Section 3.4.1, Rails uses HTML5 by default (as indicated by the doctype <!DOCTYPE html>); since the HTML5 standard is relatively new, some browsers (especially older versions of Internet Explorer) don’t fully support it, so we include some JavaScript code (known as an “HTML5 shim (or shiv)”)3 to work around the issue:
<!--[if lt IE 9]>
  <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js">
  </script>
<![endif]-->
The somewhat odd syntax
<!--[if lt IE 9]>
includes the enclosed line only if the version of Microsoft Internet Explorer (IE) is less than 9 (if lt IE 9). The weird [if lt IE 9] syntax is not part of Rails; it’s actually a conditional comment supported by Internet Explorer browsers for just this sort of situation. It’s a good thing, too, because it means we can include the HTML5 shim only for IE browsers less than version 9, leaving other browsers such as Firefox, Chrome, and Safari unaffected.
