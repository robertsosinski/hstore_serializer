Gem::Specification.new do |s|
  s.name          = 'hstore_serializer'
  s.version       = '0.1.0'
  s.date          = '2012-02-24'
  s.summary       = "Convert Postgres HStores to and from Ruby Hashes."
  s.description   = s.summary
  s.authors       = ["Robert Sosinski", "JT Archie", "Cody Caughlan", "Juan Maiz", "Diogo Biazus"]
  s.email         = 'email@robertsosinski.com'
  s.homepage      = 'https://github.com/robertsosinski/hstore_serializer'
  s.files         = Dir['hstore_serializer.gemspec', 'LICENSE', 'README.md', '**/*.rb']
  s.require_paths = ['lib']
  s.has_rdoc      = false
end