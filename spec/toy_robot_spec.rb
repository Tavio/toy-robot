require 'spec_helper'

describe ToyRobot::ToyRobot do
  let(:tabletop) { ToyRobot::Tabletop.new(5, 5) }

  subject { ToyRobot::ToyRobot.new(tabletop) }

  describe '#place' do
    let(:position) { ToyRobot::Position.new(1, 1) }

    context 'when specified position is valid' do
      before { tabletop.stubs(:can_place?).returns(true) }

      it 'places the robot at the specified position' do
        subject.place(position, :north)
        expect(subject.position).to eq position
      end

      it 'places the robot facing the specified direction' do
        subject.place(position, :north)
        expect(subject.facing_direction).to eq :north
      end
    end

    context 'when specified position is invalid' do
      before { tabletop.stubs(:can_place?).returns(false) }

      it "does not change the robot's current position" do
        subject.place(position, :north)
        expect(subject.position).to eq nil 
      end

      it "does not change the robot's current facing direction" do
        subject.place(position, :north)
        expect(subject.facing_direction).to eq nil
      end
    end
  end
end
