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

Current version should be something like 1.5.0 (, which has some brand new capabilities to write literate 
coffee-script in Markdown style ;))

Along with coffee-script comes the coffee-equivalent to make and rake, called `cake`.
Trying cake in the projects root will allow you to see available cake tasks for this project,
but to make all of them work, we have to install one other dependency.

#### headless phantom

To get out tests integrated to an integrated testing environment we for sure want to run our tests
also on the commandline and to do so we install a headless browser, that executes our javascript
without opening disturbing system browsers or something like that.

`brew install phantomjs`. Current version is 1.8.1

If you can run the `phantom` commant, you are finished and ready to run the `cake` tasks 
provided by this project.


### what is this all about?

comming soon.





