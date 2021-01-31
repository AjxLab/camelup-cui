# frozen_string_literal: true

desc 'Run rubocop checks'
task rubocop: %i[rubocop_security rubocop_frozen_string_literals]

desc 'Run rubocop security check'
task :rubocop_security do
  sh 'bundle exec rubocop src --only Security'
end

desc 'Run rubocop string literals check'
task :rubocop_frozen_string_literals do
  sh 'bundle exec rubocop src --auto-correct-all --only Style/FrozenStringLiteralComment'
end
