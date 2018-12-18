require 'rails_helper'

RSpec.describe Utility::NewProgram, type: :model do

  it "validates PROGRAM valid 1" do
    file = File.read(RSPEC_ROOT + "/examples/program_valid_1")
    utility = Utility::NewProgram.new(file).run
    expect(utility.program_name).to be == "12345"
    expect(utility.product_code).to be == "FL4CLE"
    cut = utility.cuts[0]
    expect(cut.order).to be == "1"
    expect(cut.qty).to be == "1"
    expect(cut.x).to be == "234"
    expect(cut.y).to be == "567"

  end

  it "validates PROGRAM valid 2" do
    file = File.read(RSPEC_ROOT + "/examples/program_valid_2")
    utility = Utility::NewProgram.new(file).run
    expect(utility.program_name).to be == "AAAA"
    expect(utility.product_code).to be == "FL4CLE"
    cut = utility.cuts[0]
    expect(cut.order).to be == "8"
    expect(cut.qty).to be == "5"
    expect(cut.x).to be == "555"
    expect(cut.y).to be == "666"
    cut = utility.cuts[1]
    expect(cut.order).to be == "9"
    expect(cut.qty).to be == "6"
    expect(cut.x).to be == "777"
    expect(cut.y).to be == "888"

  end

  it "validates PROGRAM presence" do
    file = File.read(RSPEC_ROOT + "/examples/program_no_program")
    expect { Utility::NewProgram.new(file).run }.to raise_error(Error::CutMachineProgram)
  end

  it "validates PRODUCT_CODE presence" do
    file = File.read(RSPEC_ROOT + "/examples/program_no_product_code")
    expect { Utility::NewProgram.new(file).run }.to raise_error(Error::CutMachineProgram)
  end

  it "validates NEW_CUT presence" do
    file = File.read(RSPEC_ROOT + "/examples/program_no_new_cut")
    expect { Utility::NewProgram.new(file).run }.to raise_error(Error::CutMachineProgram)
  end
end
