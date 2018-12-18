class PolishType < ApplicationRecord

  NONE = "None".freeze

  def polish?
    name != NONE
  end
end
