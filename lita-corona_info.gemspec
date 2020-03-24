Gem::Specification.new do |spec|
  spec.name = "lita-corona_info"
  spec.version = "0.1.0"
  spec.authors = ["Theophile-Kango"]
  spec.email = ["fadhili.kango@gmail.com"]
  spec.description = "Add a description"
  spec.summary = "Add a summary"
  spec.homepage = "http://localhost:3000"
  spec.license = "Add a license"
  spec.metadata = { "lita_plugin_type" => "handler" }

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "lita-jenkins"
  spec.add_development_dependency "lita-ping"
  spec.add_development_dependency "lita-hipchat"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "lita-karma"
end
