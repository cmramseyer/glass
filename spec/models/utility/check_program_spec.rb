require 'rails_helper'

RSpec.describe Utility::CheckProgram, type: :model do

  context 'when programs AAA001 is stored' do
    
    it "new program called AAA002 is allowed" do
      expect(Utility::CheckProgram.name_uniqueness("AAA002")).to be_nil
    end
    it "new program called AAA001 is not allowed" do
      expect {Utility::CheckProgram.name_uniqueness("AAA001")}.to raise_error(Error::CutMachineProgram)
    end
    it "new program with blank name is not allowed" do
      expect {Utility::CheckProgram.name_uniqueness(" ")}.to raise_error(Error::CutMachineProgram)
    end
  end

  context 'when product Float 4mm. Clear with code FL4CLE is stored' do
    
    it "new program with product code FL4CLE is allowed" do
      expect(Utility::CheckProgram.product_existence("FL4CLE")).to be_nil
    end
    it "new program with product code FL3BLK is not allowed" do
      expect {Utility::CheckProgram.product_existence("FL3BLK")}.to raise_error(Error::CutMachineProgram)
    end
  end
  
end
