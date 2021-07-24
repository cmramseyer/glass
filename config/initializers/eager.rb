# eager load report modules for reports#new options select
# so Report::Header.constants => [:Simple, :Fancy]
# if modules are not eager loaded
# Report::Header.constants => []

Dir["#{Rails.root}/app/models/report/type/*.rb"].each {|file| load file}
Dir["#{Rails.root}/app/models/report/header/*.rb"].each {|file| load file}
Dir["#{Rails.root}/app/models/report/body/*.rb"].each {|file| load file}
Dir["#{Rails.root}/app/models/report/footer/*.rb"].each {|file| load file}
Dir["#{Rails.root}/app/models/report/margin/*.rb"].each {|file| load file}
Dir["#{Rails.root}/app/models/report/page_size/*.rb"].each {|file| load file}
