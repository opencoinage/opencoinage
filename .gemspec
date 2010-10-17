#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

GEMSPEC = Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'opencoinage'
  gem.homepage           = 'http://opencoinage.org/sdk/ruby'
  gem.license            = 'Public Domain' if gem.respond_to?(:license=)
  gem.summary            = 'Open-source digital cash.'
  gem.description        = gem.summary
  gem.rubyforge_project  = 'opencoinage'

  gem.author             = 'OpenCoinage.org'
  gem.email              = 'opencoinage@googlegroups.com' # @see http://groups.google.com/group/opencoinage

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS CREDITS README UNLICENSE VERSION) + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w()
  gem.default_executable = gem.executables.first
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()
  gem.has_rdoc           = false

  gem.required_ruby_version      = '>= 1.8.1'
  gem.requirements               = []
  gem.add_development_dependency 'yard' ,    '>= 0.6.0'
  gem.add_development_dependency 'rspec',    '>= 1.3.0'
  gem.add_runtime_dependency     'uuid',     '>= 2.3.1'
  gem.add_runtime_dependency     'rdf',      '~> 0.2.3'
  gem.add_runtime_dependency     'bitcache', '~> 0.0.1'
  gem.post_install_message       = nil
end
