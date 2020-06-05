require 'rails_helper'

describe Reward, type: :model do
  describe 'states' do
    it 'should be default state as :created' do
      expect(build(:reward).created?).to eql(true)
    end

    it 'should be possible to confirm a reward ' do
      reward = build(:reward)
      reward.confirmed!

      expect(reward.confirmed?).to eql(true)
    end
  end
end
