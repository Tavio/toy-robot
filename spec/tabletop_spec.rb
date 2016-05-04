require 'spec_helper'

describe ToyRobot::Tabletop do
  let(:rows) { 5 }
  let(:columns) { 5 }
  
  subject { ToyRobot::Tabletop.new(rows, columns) }

  describe '#can_place' do
    it "returns true when robot can be placed at the specified position" do
      position = ToyRobot::Position.new(1, 1)
      expect(subject.can_place?(position)).to be_truthy 
    end

    it "returns false when robot cannot be placed at the specified position" do
      position = ToyRobot::Position.new(6, 7)
      expect(subject.can_place?(position)).to be_falsy
    end
  end

end
