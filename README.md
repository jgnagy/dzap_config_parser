DZAP Config Parser Example
==========================

About
-----
This is a really simple gem to allow the definition and use of a configuration parser. The idea is, define new config file formats using a regexp and an Array of comment characters. It attempts the most simple of type casting.

The gem is a framework around a `Format` class, requiring new formats to be subclasses that override the `initialize` and `parse!` methods.

Building
-----

Building the gem requires a modern Ruby:

    # highly recommend using RVM here, and Ruby 2.x or above
    gem build config_parser.gemspec
    # install what you just built
    gem install ./config_parser-*.gem

Usage
-----

Require the right gem:

    require 'config_parser'

Require the config format you intend to parse (currently only `Formats::DZAP` is available):

    require 'config_parser/formats/dzap'

Now parse a config file:

    # Use the class method #parse on the Parser class, passing the
    # path to the config and class to use to parse it
    config = Parser.parse("/path/to/the/config.conf", Formats::DZAP)

You can access the information in the config now using either typical Hash access patterns or treating config keys / properties as attributes:

    config.host
    #=> "test.com"
    config[:server_id]
    #=> 55331
    config["server_load_alarm"]
    #=> 2.5
    config.debug_mode
    #=> false

That's pretty much all there is to it. To access the documentation, you'll need the YARD gem. Simply run `yard` to compile the documentation, then open `doc/index.html` in your favorite web browser.

License
-------

The config parser is distributed under the MIT License