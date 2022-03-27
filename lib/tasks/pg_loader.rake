require 'faker'

namespace :pg_loader do
  desc 'creates 1000 random orders'

  task orders: :environment do

    all_products = Product.all
    all_polish_types = PolishType.all
    current_user = User.find_by_email('admin@glass.com')
    
    10.times do 
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

  task random_cut: :environment do

    puts "executing random cut"

    current_user = User.find_by_email('admin@glass.com')
    @cut_tracking = Tracking.where(stage: Stage.cut)
    @available_cuts = @cut_tracking.select(&:available_works?)

    if @available_cuts.empty?
      puts "no available cuts"
      return nil
    end

    tracking = @available_cuts.sample

    program_name = Faker::Alphanumeric.alphanumeric(number: 10)
    product_code = tracking.product_line_product_code
    order_id = tracking.product_line.order.id
    qty = rand(1..tracking.available_works)
    x = tracking.product_line.width
    y = tracking.product_line.height

    new_program = "PROGRAM=#{program_name}\r\nPRODUCT_CODE=#{product_code}\r\nNEW_CUT\r\nORDER=#{order_id}\r\nQTY=#{qty}\r\nX=#{x}\r\nY=#{y}"

    Service::CreateProgramAndPerformCuts.new(new_program, current_user).run

  end

  task random_work: :environment do

    puts "executing random work"

    current_user = User.find_by_email('admin@glass.com')
    cut_id = Stage.find_by_name('Cut').id
    available_tracking = Tracking.where.not(stage_id: cut_id).select(&:available_works?).sample
    
    if available_tracking.nil?
      puts "no available work"
      return nil
    end
    Service::PerformWork.new(available_tracking, 1, current_user).run

  end

  task random_script: :environment do

    if rand(0..100) == 50
      puts "creating order"
      Rake::Task["pg_loader:orders"].execute
    end

    random = rand(0..9)
    random > 7 ? Rake::Task["pg_loader:random_cut"].execute : Rake::Task["pg_loader:random_work"].execute

  end

  task execute_random_script: :environment do
    1000.times do
      sleep(10)
      Rake::Task["pg_loader:random_script"].execute
    end
  end
  
  
end