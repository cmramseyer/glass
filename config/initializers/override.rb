# load util methods to ruby classes

Dir["#{Rails.root}/lib/override/*.rb"].each {|file| load file}