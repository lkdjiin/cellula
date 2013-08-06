# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'cellula'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'Cellular Automata framework with a simple DSL'
  s.homepage = 'https://github.com/lkdjiin/cellula'
  s.description = %q{Cellula aims to be a framework for building,
running and studying cellular automata.}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*'].to_a + readmes
	s.license = 'Apache v2 License'
	s.required_ruby_version = '>= 2.0.0'
	s.executables = ['cellula']
  s.add_dependency 'docile', '1.1.0'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'reek'
  s.add_development_dependency 'coco', '>= 0.7.1'
  s.add_development_dependency('yard')
  s.add_development_dependency('yard-tomdoc')
end
