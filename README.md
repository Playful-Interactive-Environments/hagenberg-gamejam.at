# hagenberg-gamejam.at

Website for the Hagenberg Game Jam

## Development on Windows

These are the complete development instructions to get a development machine running under Microsoft Windows.

### Install Git and Clone the Repository

Get the Git binaries from <https://git-scm.com/> or download GitHub Desktop from <https://desktop.github.com/>, then clone the repository to your local machine (e.g., `C:\Users\[User]\Documents\GitHub\hagenberg-gamejam.at`).

### Install Ruby

Go to <http://rubyinstaller.org/>, download the latest installer for Ruby and run it. Native extensions are built via MSYS2/MinGW. Even though the ruby installer does contain an installer, it is a bit outdated and might give you GPG key issues. Therefore, install MSYS2 from <https://www.msys2.org/#installation> before installing Ruby. 

If you're using [Chocolatey](https://chocolatey.org/), run `choco install msys2 ruby` to get both packages at once.

Then run `ridk install 3` to install the development toolchain.

### Install all Gems with Bundler

First, install Bundler by calling `gem install bundler`. Then use `bundle install` to install Jekyll and all required dependencies.

### Start the development server

Use `bundle exec jekyll serve --watch` to start the development server.

### Build the site

To build the site for deployment, call `bundle exec jekyll build`, then transfer the contents of the `_site` folder to the webserver.

## Development on Mac OS X

These are the complete development instructions to get a development machine running under Mac OS X.

### Install Git and Clone the Repository

Get the Git binaries from <https://git-scm.com/> or download GitHub Desktop from <https://desktop.github.com/>, then clone the repository to your local machine (e.g., `/Documents/GitHub/hagenberg-gamejam.at`).

### Install Ruby

Use the Ruby Version Manager (RVM) to get the latest Ruby version installed. Go to <https://rvm.io/> and follow the installation instructions on the front page. Provide the flag `--ruby` to install ruby together with RVM in one go.

If you're using [Homebrew](https://brew.sh/), run `brew install ruby` to install the latest version.

### Install all Gems with Bundler

First, install Bundler by calling `gem install bundler`. Then use `bundle install` to install Jekyll and all required dependencies.

### Start the development server

Use `bundle exec jekyll serve --watch` to start the development server.

### Build the site

To build the site for deployment, call `bundle exec jekyll build`, then transfer the contents of the `_site` folder to the webserver.

## Update Dependencies

To update all Ruby gems involved, run `bundle update`. To remove (now unused) older versions, type `gem cleanup`.
