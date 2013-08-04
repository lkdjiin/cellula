# -*- encoding: utf-8 -*-

require 'coco'
$CELLULA_PATH = File.expand_path(File.join(File.expand_path(File.dirname(__FILE__)), '..'))


require './lib/cellula'
include Cellula

RSpec.configure do |config|
  config.order = "random"
end

def fixture_file filename
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read file_path
end

def fixture_file_path filename
  File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
end

StudyMethod = Struct.new(:method)
