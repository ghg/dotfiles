begin
  # wtf
  $LOAD_PATH << '/Users/greg/.rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/awesome_print-1.2.0/lib'
  $LOAD_PATH << '/Users/greg/.rbenv/versions/1.9.3-p448/lib/ruby/gems/1.9.1/gems/awesome_print-1.2.0/lib'
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
  # Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError
  # puts "no awesome_print :("
end
