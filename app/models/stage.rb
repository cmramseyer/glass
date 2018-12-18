class Stage < ApplicationRecord

  def self.symbols
    all.map(&:name).map { |sym| sym.to_s.parameterize(separator: "_") }
  end

  def self.delivery
    @delivery ||= Stage.find_by_name('Delivery') || Stage.create(name: "Delivery")
  end

  def self.stages_for_inject_cut
    [self.drill, self.polish, self.temper, self.delivery]
  end

  def self.temper
    @temper ||= Stage.find_by_name("Temper") || Stage.create(name: "Temper")
  end

  def self.polish
    @polish ||= Stage.find_by_name("Polish") || Stage.create(name: "Polish")
  end

  def self.drill
    @drill ||= Stage.find_by_name("Drill") || Stage.create(name: "Drill")
  end

  def self.cut
    @cut ||= Stage.find_by_name("Cut") || Stage.create(name: "Cut")
  end

  def icon_name
    case name
    when 'Cut' then 'fa-cut'
    when 'Drill' then 'fa-circle-thin'
    when 'Polish' then 'fa-certificate'
    when 'Temper' then 'fa-fire'
    when 'Delivery' then 'fa-truck'
    end 
  end

  def complete_work_tooltip_message
    case name
    when 'Cut' then ''
    when 'Drill' then 'Complete One Drill Work'
    when 'Polish' then 'Complete One Polish Work'
    when 'Temper' then 'Complete One Temper Work'
    when 'Delivery' then 'Complete One Delivery Work'
    end 
  end


end
