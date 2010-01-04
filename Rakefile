# -*- ruby -*-

require 'rubygems'
require 'rake'
require 'hoe'

LIB_DIR = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH << LIB_DIR
require 'taka'

Hoe.spec('taka') do
  developer('Aaron Patterson', 'aaronp@rubyforge.org')
  developer('Mike Dalessio', 'mike.dalessio@gmail.com')
  self.readme_file   = 'README.rdoc'
  self.history_file  = 'CHANGELOG.rdoc'
  self.extra_rdoc_files  = FileList['*.rdoc']
  self.extra_deps    = [['nokogiri', '>= 1.4.1']]
end

file 'vendor/jquery/jquery/dist/jquery.js' do
  Dir.chdir('vendor/jquery/jquery') do
    sh "make"
  end
end

namespace :test do
  desc "run jquery tests"
  task :jquery => 'vendor/jquery/jquery/dist/jquery.js' do
    require 'test/jquery/test_jquery'
  end

  desc "run dom tests"
  task :dom do
    Dir.glob('test/dom/**/*.rb').each do |file|
      require file
    end
  end
end

# vim: syntax=Ruby
