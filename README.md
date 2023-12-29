# hagenberg-gamejam.at

Website for the Hagenberg Game Jam.

## Development on Windows

These are the complete instructions for running a development machine under Microsoft Windows.

### Install Git and Clone the Repository

Get the Git binaries from <https://git-scm.com/> or download GitHub Desktop from <https://desktop.github.com/>, then clone the repository to your local machine (e.g., `C:\Users\[User]\Documents\GitHub\hagenberg-gamejam.at`).

### Install Ruby

Go to <http://rubyinstaller.org/>, download the latest installer for Ruby, and run it. Native extensions are built via MSYS2/MinGW. Even though the ruby installer does contain an installer, it is a bit outdated and might give you GPG key issues. Therefore, install MSYS2 from <https://www.msys2.org/#installation> before installing Ruby. 

If you're using [Chocolatey](https://chocolatey.org/), run the following command to get both packages at once:

```powershell
choco install msys2 ruby
```

Then install the development toolchain:
```powershell
ridk install 3
```

### Install all Gems with Bundler

First, install Bundler:
```powershell
gem install bundler
```

Then install Jekyll and all required dependencies:
```powershell
bundle install
```

### Start the Development Server

Use Bundler to start the development server:

```powershell
bundle exec jekyll serve --watch
```

### Build the Site

To build the site for deployment, call Jekyll's build command:

```powershell
bundle exec jekyll build
```

Then, transfer the contents of the `_site` folder to the webserver.

## Development on Mac OS X

These are the complete instructions for running a development machine under Mac OS X.

### Install Git and Clone the Repository

Get the Git binaries from <https://git-scm.com/> or download GitHub Desktop from <https://desktop.github.com/>, then clone the repository to your local machine (e.g., `/Documents/GitHub/hagenberg-gamejam.at`).

### Install Ruby

Use the Ruby Version Manager (RVM) to get the latest Ruby version installed. Go to <https://rvm.io/> and follow the installation instructions on the front page. Provide the flag `--ruby` to install ruby together with RVM in one go.

If you're using [Homebrew](https://brew.sh/), run the following command to install the latest version:

```shell
brew install ruby
```

### Install all Gems with Bundler

First, install Bundler:

```shell
gem install bundler
```

Then install Jekyll and all required dependencies:

```shell
bundle install
```

### Start the Development Server

Use Bundler to start the development server:

```shell
bundle exec jekyll serve --watch
```

### Build the Site

To build the site for deployment, call Jekyll's build command:

```shell
bundle exec jekyll build
```

Then, transfer the contents of the `_site` folder to the webserver.

## Update Dependencies

To update all Ruby gems involved, run Bundler's update command:

```shell
bundle update
```

To remove (now unused) older versions, clean up old gems:

```shell
gem cleanup
```

