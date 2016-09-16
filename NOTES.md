## Resource Trail
+ http://stackoverflow.com/questions/31039998/address-already-in-use-bind2-errnoeaddrinuse
+ used chp 3 to 14: [*Ruby on Rails Tutorial*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/)
+ http://www.theodinproject.com/ruby-on-rails
+ https://www.jitbit.com/alexblog/256-targetblank---the-most-underestimated-vulnerability-ever/



-- IE shim --
Let’s look at the new elements in Listing 5.1 from top to bottom. As alluded to briefly in Section 3.4.1, Rails uses HTML5 by default (as indicated by the doctype <!DOCTYPE html>); since the HTML5 standard is relatively new, some browsers (especially older versions of Internet Explorer) don’t fully support it, so we include some JavaScript code (known as an “HTML5 shim (or shiv)”)3 to work around the issue:
<!--[if lt IE 9]>
  <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js">
  </script>
<![endif]-->
The somewhat odd syntax
<!--[if lt IE 9]>
includes the enclosed line only if the version of Microsoft Internet Explorer (IE) is less than 9 (if lt IE 9). The weird [if lt IE 9] syntax is not part of Rails; it’s actually a conditional comment supported by Internet Explorer browsers for just this sort of situation. It’s a good thing, too, because it means we can include the HTML5 shim only for IE browsers less than version 9, leaving other browsers such as Firefox, Chrome, and Safari unaffected.
