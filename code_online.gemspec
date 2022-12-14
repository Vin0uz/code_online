# frozen_string_literal: true

require_relative "lib/code_online/version"

Gem::Specification.new do |spec|
  spec.name = "code_online"
  spec.version = CodeOnline::VERSION
  spec.authors = ["Vin0uz"]
  spec.email = ["kevin@vinhas.fr"]

  spec.summary = "A simple and automated bot over interface of GS1' codeonline website."
  spec.homepage = "https://github.com/Vin0uz/code_online"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Vin0uz/code_online"
  spec.metadata["changelog_uri"] = "https://github.com/Vin0uz/code_online/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "watir"
  spec.add_dependency "webdrivers"
end
