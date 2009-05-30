# -*- ruby -*-

require 'rubygems'
require 'johnson'
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

class FakeWindow
end

class FakeNavigator
  def userAgent
    "hello world"
  end

  def js_property? name
    [:userAgent].include? name
  end
end

namespace :test do
  task :jquery => 'vendor/jquery/jquery/dist/jquery.js' do
    Dir.chdir 'vendor/jquery/jquery' do
      doc = Taka::DOM::HTML(File.read('test/index.html'))
      scripts = doc.getElementsByTagName 'script'
      rt = Johnson::Runtime.new

      rt['window']    = FakeWindow.new
      rt['navigator'] = FakeNavigator.new
      rt['document']  = doc

      scripts.each do |tag|
        if tag['src']
          filename = File.expand_path(tag['src'].sub('..', '.'))
          rt.evaluate File.read(filename), filename, 1
        else
          rt.evaluate tag.content
        end
      end
    end
  end
end

# vim: syntax=Ruby
