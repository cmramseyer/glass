class Stage < ApplicationRecord

  validates :workload, presence: true

  CUT = 'Cut'.freeze
  DRILL = 'Drill'.freeze
  POLISH = 'Polish'.freeze
  TEMPER = 'Temper'.freeze
  DELIVERY = 'Delivery'.freeze

  def cut?
    name == CUT
  end

  def drill?
    name == DRILL
  end

  def polish?
    name == POLISH
  end

  def temper?
    name == TEMPER
  end

  def delivery?
    name == DELIVERY
  end

  def self.symbols
    all.map(&:name).map { |sym| sym.to_s.parameterize(separator: "_") }
  end

  def self.stages_for_inject_cut
    [self.drill, self.polish, self.temper, self.delivery]
  end

  def self.delivery
    @delivery ||= Stage.find_by_name('Delivery')
  end

  def self.temper
    @temper ||= Stage.find_by_name("Temper")
  end

  def self.polish
    @polish ||= Stage.find_by_name("Polish")
  end

  def self.drill
    @drill ||= Stage.find_by_name("Drill")
  end

  def self.cut
    @cut ||= Stage.find_by_name("Cut")
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
