require 'faker'

namespace :pg_loader do
  desc 'creates 1000 random orders'

  task orders: :environment do

    all_products = Product.all
    all_polish_types = PolishType.all
    current_user = User.find_by_email('admin@glass.com')
    
    1000.times do 
      order = Order.new
      order.customer = Faker::Name.name
      order.description = Faker::Lorem.sentence
      order.delivery_address = "#{Faker::Address.city}, #{Faker::Address.street_address}"
      order.priority = ["Low", "Normal", "High"].sample

      rand(1..5).times do
        product_line = order.product_lines.build
        product_line.product = all_products.sample
        product_line.quantity = rand(1..20)
        product_line.width = rand(100..3600)
        product_line.height = rand(100..3600)
        product_line.holes_quantity = [true, false].sample ? rand(1..4) : 0
        product_line.polish_type = all_polish_types.sample
        product_line.tempered = [true, false].sample
      end

      order.save!
      Service::OrderActivation.new(order, current_user, true).run
    end


  end
end