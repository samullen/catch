# Catch

Ruby wrapper for the [Catch API](http://developer.catch.com).

## Installation

  sudo gem install catch

## Usage

### Instantiate a client (Basic Auth)

  catch = Catch::Client.new(:username => "fooman", :password => "supersecrete")

### or configure once

  Catch.configure do |config|
    config.username = "fooman"
    config.password = "supersecret"
  end
  catch = Catch::Client.new

#### Examples

  catch.user

## Note on Patches/Pull Requestso

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2011 Samuel Mullen. See LICENSE for details.

