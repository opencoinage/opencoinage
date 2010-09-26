#!/usr/bin/env jruby
require 'buildr'

# Specify Maven 2.0 remote repositories here:
repositories.remote << 'http://www.ibiblio.org/maven2/'

# Specify the project's directory layout here:
LAYOUT = Layout.new
LAYOUT[:source, :main, :java]       = 'src/java'
LAYOUT[:source, :spec, :ruby]       = 'spec/java'
LAYOUT[:reports, :rspec]            = 'spec/java/reports'
LAYOUT[:target, :main]              = 'pkg/java'
LAYOUT[:target]                     = 'pkg/java'

desc   "OpenCoinage SDK for Java"
define 'opencoinage', :layout => LAYOUT do
  project.version = File.read('VERSION').chomp
  project.group   = 'opencoinage'
  manifest['Implementation-Vendor']  = 'OpenCoinage.org'
  manifest['Implementation-Version'] = project.version

  compile.options.target = '1.5'
  test.using :rspec
  package :jar
end

RakeFileUtils.verbose_flag = false
