#!/usr/bin/env ruby
$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), 'lib')))
require 'rubygems'
begin
  require 'rakefile' # http://github.com/bendiken/rakefile
rescue LoadError => e
end
require 'opencoinage'

PKG_VERSION   = File.read('VERSION').chomp
RUBY_GEM_FILE = "pkg/ruby/opencoinage-#{PKG_VERSION}.gem"
JAVA_JAR_FILE = "pkg/java/opencoinage-#{PKG_VERSION}.jar"

file RUBY_GEM_FILE do
  sh "mkdir -p pkg/ruby/"
  sh "gem build .gemspec"
  sh "mv #{File.basename(RUBY_GEM_FILE)} pkg/ruby/"
end

file JAVA_JAR_FILE do
  sh "buildr package"
end

namespace :build do
  desc "Builds the #{RUBY_GEM_FILE} file"
  task :ruby => RUBY_GEM_FILE

  desc "Builds the #{JAVA_JAR_FILE} file"
  task :java => JAVA_JAR_FILE
end

namespace :spec do
  desc "Runs the specs for the OpenCoinage SDK for Ruby"
  task :ruby do
    sh "ruby -S spec -cfn spec/ruby/"
  end

  desc "Runs the specs for the OpenCoinage SDK for Java (requires JRuby)"
  task :java => JAVA_JAR_FILE do
    sh "jruby -S spec -cfn spec/java/"
  end
end
