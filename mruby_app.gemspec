Gem::Specification.new do |spec|
  name = "mruby_app"
  root = File.expand_path('..', __FILE__)
  require File.join(root, "lib", name, "version.rb").to_s
  require "pathname"

  spec.name = name
  spec.version = MrubyApp::VERSION
  spec.authors = ["Daniel Inkpen"]
  spec.email = ["dan2552@gmail.com"]

  spec.summary = "A CLI tool for using Ruby (mruby) code as a project."
  spec.description = spec.summary
  spec.homepage = "https://github.com/Dan2552/#{name}"
  spec.license = "MIT"

  spec.files = Dir
    .glob(File.join(root, "**", "*.rb"))
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
    .map { |f| Pathname.new(f).relative_path_from(root).to_s }

  if File.directory?(File.join(root, "exe"))
    spec.bindir = "exe"
    spec.executables = Dir.glob(File.join(root, "exe", "*"))
      .map { |f| File.basename(f) }
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
end
