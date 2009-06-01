# -*- ruby -*-

require 'rubygems'
require 'rake'
require 'hoe'

LIB_DIR = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH << LIB_DIR
require 'taka'

HOE = Hoe.new('taka', Taka::VERSION) do |p|
  p.developer('Aaron Patterson', 'aaronp@rubyforge.org')
  p.developer('Mike Dalessio', 'mike.dalessio@gmail.com')
  p.readme_file   = 'README.rdoc'
  p.history_file  = 'CHANGELOG.rdoc'
  p.extra_deps      = [['nokogiri', '>= 1.2.3']]
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
