Gem::Specification.new do |s|
  s.name         = "stimmung"
  s.version      = "0.0.3"
  s.date         = Date.today
  s.summary      = "Simple German sentiment analysis"
  s.description  = "Sentiment analysis for the German language"
  s.authors      = ["Pachacamac"]
  s.email        = "pachacamac@inboxalias.com"
  s.files        = Dir["lib/*"] << "README.md"
  s.homepage     = "https://github.com/pachacamac/stimmung"
  s.platform     = Gem::Platform::RUBY
  s.require_path = "."
  s.require_paths << "lib"
  s.license      = "MIT"
end
