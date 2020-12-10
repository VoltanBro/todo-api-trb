require 'simplecov'
SimpleCov.start('rails') do
  add_filter('spec')
  add_filter do |source_file|
    source_file.lines.count < 5
  end
end
SimpleCov.minimum_coverage(90)
