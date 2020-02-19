# hagenberg-gamejam.at
Website for the Hagenberg Game Jam

## Development on Windows

These are the full development instructions to get a development machine running under Microsoft Windows.

### Install Git and Clone the Repository

Get the Git binaries from <https://git-scm.com/> or download GitHub Desktop from <https://desktop.github.com/>, then clone the repository to your local machine (e.g., `C:\Users\[User]\Documents\GitHub\hagenberg-gamejam.at`).

### Install Ruby

Go to <http://rubyinstaller.org/>, download the latest installer for Ruby and run it. Also install the development kit so you can build native extensions.

### Install all Gems with Bundler

Use `bundle install` to install Jekyll and all required dependencies.

### Start the development server

Use `bundle exec jekyll serve --watch` to start the development server.

## Development on Mac OS X

These are the full developement instructions to get a development machine running under Mac OS X.

### Install Git and Clone the Repository

Get the Git binaries from <https://git-scm.com/> or download GitHub Desktop from <https://desktop.github.com/>, then clone the repository to your local machine (e.g., `/Documents/GitHub/hagenberg-gamejam.at`).

### Install Ruby

Use the Ruby Version Manager (RVM) to get the latest Ruby version installed. Go to <http://rvm.io/> and follow the installation instructions on the front page. Provide the flag `--ruby` to install ruby together with RVM in one go.

### Install all Gems with Bundler

Use `bundle install` to install Jekyll and all required dependencies.

### Start the development server

Use `bundle exec jekyll serve --watch` to start the development server.
