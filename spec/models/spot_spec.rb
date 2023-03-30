require 'rails_helper'
RSpec.describe Spot, type: :model do
  let(:user) {User.create(email: "tim@yahoo.com", first_name: "tim", last_name: "tom", password: "secret", description: "Hi, I'm Tim Tom!")}
  let(:spot) {Spot.new(location: "Nerima station", user: user , description: "Very big, quite nice.", category: "location", hours_open: "4am to 2am", name: "Nerima station" )}
  describe '#initialize' do
    it 'is valid with all columns present' do
      expect(spot.valid?).to eq(true)
    end
    context 'with missing name' do
      before do
          spot.name = nil
      end
      it 'is not valid without name' do
        expect(spot.valid?).to eq(false)
      end
    end
    context 'with missing name' do
      before do
          spot.title = nil
      end
      it 'returns error message with missing name' do
        spot.valid?
        expect(spot.errors.messages).to eq(name: ["can't be blank"])
      end
    end
  end
end
