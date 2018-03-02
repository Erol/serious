require "bundler/gem_tasks"

task :default => :spec

task :spec do
  Dir['spec/serious/**/*.rb'].each do |file|
    load file
  end
end
