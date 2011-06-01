# An example Ruby on Rails 2.3 application that uses Ruby AMQP gem with Unicorn #

This app demonstrates how you can integrate [Ruby amqp gem](http://github.com/ruby-amqp/amqp) into a Ruby on Rails application that runs on [Unicorn](http://unicorn.bogomips.org/).

## Getting Started ##

    gem install bundler

and then

    bundle install

finally,

    unicorn_rails --port=3000 -c config/unicorn/development.rb


## What does it do? ##

On application boot, Unicorn forks 1 worker and that worker starts EventMachine event loop in a separate
thread and then  establishes connection to AMQP broker. The key here is to not start EventMachine reactor
before the fork: due to a known EventMachine issue, this will result in a reactor in limbo (because forking
has side effects on open file descriptors). Restarting it is possible but not without hacks and requires
some knowledge about EventMachine internals.

Once connection is established, we publish a bunch of messages using default direct exchange.


## License ##

Apache Public License 2.0.

See LICESE file in the repository root.
