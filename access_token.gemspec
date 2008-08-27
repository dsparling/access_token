Gem::Specification.new do |s|
  s.name = %q{access_token}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["doug sparling"]
  s.date = %q{2008-08-25}
  s.default_executable = %q{generate_token.rb}
  s.description = %q{Create and check simple time-based access token}
  s.email = ["doug.sparling@gmail.com"]
  s.executables = ["generate_token.rb"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "bin/generate_token.rb", "config/hoe.rb", "config/requirements.rb", "lib/access_token.rb", "lib/access_token/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "spec/access_token_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/rspec.rake", "tasks/website.rake", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://access_token.rubyforge.org}
  s.post_install_message = %q{
For more information on access_token, see http://access_token.rubyforge.org

NOTE: Change this information in PostInstall.txt 
You can also delete it if you don't want it.


}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{access_token}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Create and check simple time-based access token}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
