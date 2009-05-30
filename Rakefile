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

class NokogiriTestTask < Rake::TestTask
  def initialize *args
    super
    %w[ ext lib bin test ].each do |dir|
      self.libs << dir
    end
    self.test_files = FileList['test/**/test_*.rb'] +
      FileList['test/**/*_test.rb']
    self.verbose = "verbose"
    self.warning = true
  end
end

desc "run test suite under gdb"
NokogiriTestTask.new('test:gdb').extend(Module.new {
  def ruby *args
    cmd = "gdb --args #{RUBY} #{args.join(' ')}"
    puts cmd
    system cmd
  end
})

# vim: syntax=Ruby
