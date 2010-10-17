OpenCoinage: Open-Source Digital Cash
=====================================

_Note: this is at present pre-alpha software, and is unlikely to be of much
interest to you. Check back later!_

Dependencies
------------

* [Ruby][] (>= 1.8.7) or (>= 1.8.1 with [Backports][])
* [Bitcache](http://rubygems.org/gems/bitcache) (>= 0.0.1)
* [RDF.rb](http://rubygems.org/gems/rdf) (>= 0.2.3)
* [RSA.rb](http://rubygems.org/gems/rsa) (>= 0.1.3)
* [UUID](https://rubygems.org/gems/uuid) (>= 2.3.1)

Installation
------------

The recommended installation method is via [RubyGems](http://rubygems.org/).
To install the latest official release of OpenCoinage, do:

    % [sudo] gem install opencoinage            # Ruby 1.8.7+
    % [sudo] gem install backports opencoinage  # Ruby 1.8.x

Download
--------

To get a local working copy of the development repository, do:

    $ git clone git://github.com/opencoinage/opencoinage.git

Alternatively, download the latest development version as a tarball as
follows:

    $ wget http://github.com/opencoinage/opencoinage/tarball/master

Mailing List
------------

<http://groups.google.com/group/opencoinage>

Author
------

[Arto Bendiken](mailto:arto.bendiken@gmail.com) - <http://ar.to/>

Contributors
------------

Refer to the accompanying {file:CREDITS} file.

Contributing
------------

* Do your best to adhere to the existing coding conventions and idioms.
* Don't use hard tabs, and don't leave trailing whitespace on any line.
* Do document every method you add using [YARD][] annotations. Read the
  [tutorial][YARD-GS] or just look at the existing code for examples.
* Don't touch the `.gemspec`, `VERSION` or `AUTHORS` files. If you need to
  change them, do so on your private branch only.
* Do feel free to add yourself to the `CREDITS` file and the corresponding
  list in the the `README`. Alphabetical order applies.
* Do note that in order for us to merge any non-trivial changes (as a rule
  of thumb, additions larger than about 15 lines of code), we need an
  explicit [public domain dedication][PDD] on record from you.

License
-------

This is free and unencumbered public domain software. For more information,
see <http://unlicense.org/> or the accompanying {file:UNLICENSE} file.

[OpenCoinage]: http://opencoinage.org/
[Ruby]:        http://ruby-lang.org/
[YARD]:        http://yardoc.org/
[YARD-GS]:     http://rubydoc.info/docs/yard/file/docs/GettingStarted.md
[PDD]:         http://unlicense.org/#unlicensing-contributions
[Backports]:   http://rubygems.org/gems/backports
