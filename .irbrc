begin
  require 'awesome_print'
  require 'pry'
  Pry.start
  exit
rescue LoadError => e
  warn "=> Error loading AP or Pry"
end
