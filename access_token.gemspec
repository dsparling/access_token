Gem::Specification.new do |s|
  s.name     = "access_token"
  s.version  = "0.0.3"
  s.date     = "2008-08-24"
  s.summary  = "Generate and validate simple time-based access token"
  s.email    = "scriptrunner.com@gmail.com"
  s.homepage = "http://github.com/dsparling/access_token"
  s.description = "Generate and validate simple time-based access token."
  s.has_rdoc = true
  s.authors  = ["Doug Sparling"]
  s.files    = ["History.txt", 
                "License.txt"
		"Manifest.txt", 
		"README.txt", 
		"Rakefile", 
		"access_token.gemspec", 
                "lib/access_token.rb",
                "lib/access_token/version.rb",
                "bin/generate_token.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  #s.add_dependency("mime-types", ["> 0.0.0"])
end
