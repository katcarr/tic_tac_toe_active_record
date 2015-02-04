Tic-Tac-Toe
======================

A Ruby Sinatra interactive web application for playing the fun and exciting game of Tic-Tac-Toe.

Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
shoulda-matchers
rake
sinatra
sinatra-contrib
sinatra-activerecord
pg
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system, and running in an active session. At the time of
creation of this application, Postgres 9.4 was used. To create the necessary database schema, enter the following Rake statements into the command line:
```rake
rake db:create
rake db:migrate
rake db:test:prepare
```

At the time of initial creation of this application, Ruby
version 2.2.0 was used.

Tests
-----

Testing the ruby methods can be done via rspec.

```sh
$ gem install rspec
$ rspec
$ shoulda-matchers
```

Usage
-----

Upon completion of the above steps in the Installation section, open
up your preferred web browser and enter the following address:

```url
localhost:4567/
```

Motivation
--------
> **To Practice:**
> - Using ActiveRecord
> - User Input validation

Known Bugs
----------

None as of 2015-02-03.

Author
------

Kathryn Carr and Lizzie Koehler

License
-------

MIT license.
