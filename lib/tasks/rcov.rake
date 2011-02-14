require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  t.rcov_opts = '--exclude /gems/,/Library/,/usr/,spec,lib/tasks'
  t.pattern = 'spec/**/*_spec.rb'
end
