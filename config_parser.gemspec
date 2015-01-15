Gem::Specification.new do |s|
  s.name        = 'config_parser'
  s.version     = "0.0.1"
  s.date        = '2015-01-14'
  s.summary     = "Ruby Config Parser for DZAP"
  s.description = "A demonstration gem"
  s.authors     = ["Jonathan Gnagy"]
  s.email       = 'jonathan.gnagy@gmail.com'
  s.files       = [
    "lib/config_parser.rb",
    "lib/config_parser/format.rb",
    "lib/config_parser/formats/dzap.rb",
    "lib/config_parser/parser.rb",
    "LICENSE",
    "README.md"
  ]
  s.license     = 'MIT'
end