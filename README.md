# RequireJS Testing

## summary

This project provides a working example of testing a projects client side stack,
that includes requirejs and coffee-script with qunit.

## getting started

### prerequisites

To get started you have to install a currently usual bunch of helpful tools
for your javascript development including nodejs, coffee-script and phantomjs.

I will provide here a short guideline on how to get your stuff running
on a mac. Users of other unix distributions are mature enough to came along with
this i guess. I suggest to use homebrew here, but for sure you can adjust the 
examples to macports easily. Installations should be stable at the moment, 
so i will not provide detailed installation hints here. To get further information 
please visit the project homepages yourself.

nodejs: http://nodejs.org/
coffee-script: http://coffeescript.org/
phantomjs: http://phantomjs.org/

#### getting nodejs up and running

easy as it is `brew install node`. Current version is 0.8.20

After successful installation you should be able to use the `node` command as well 
as the `npm` node package manager command. `node` can be stopped by typing ctrl+c two times.

#### getting coffee and cake

The just installed `npm` command allows us to easily install coffee-script. The Node Package Manager
comes along with a helpful option for installing packages globally, which is the recommended style.
To do so use `npm install -g coffee-script`. To see if it was successful you can check by listing 
all installed packages with `npm list -g` or try the coffee command directly.

Along with coffee-script comes the coffee-equivalent to make and rake, called `cake`.
Trying cake in the projects root will allow you to see available cake tasks for this projekt,
but to make them work, we have to install one other dependency.








