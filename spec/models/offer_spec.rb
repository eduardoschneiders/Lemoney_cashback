require 'rails_helper'

describe Offer do
  describe 'scope published' do
    subject { Offer.published }

    shared_examples 'list the offer' do
      it 'should list offer' do
        expect(subject).to include(offer)
      end
    end

    shared_examples 'dont list the offer' do
      it 'should not list offer' do

        expect(subject).not_to include(offer)
      end
    end

    context 'when enabled, and the start_at is less than now and end_at is greater than now' do
      let!(:offer) do
        create(:offer,
                enabled: enabled,
                start_at: start_at,
                end_at: end_at,
                url: url)
      end

      let(:start_at) { Time.zone.now }
      let(:end_at) { Time.zone.now + 15.days }
      let(:enabled) { true }
      let(:url) { 'http://foo.bar' }

      it_should_behave_like 'list the offer'

      context 'when not enabled' do
        let(:enabled) { false }

        it_should_behave_like 'dont list the offer'
      end

      context 'when start_at is greater than now' do
        let(:start_at) { Time.zone.now + 15.days}

        it_should_behave_like 'dont list the offer'
      end

      context 'when end_at is less than now' do
        let(:end_at) { Time.zone.now - 15.days }

        it_should_behave_like 'dont list the offer'
      end

      context 'when url is null' do
        let(:url) { nil }

        it_should_behave_like 'dont list the offer'
      end
    end

    describe 'order' do
      let!(:premium_offer1) do
        create(:offer, :premium,
              advertiser_name: 'p1', start_at: Time.zone.now -  4.hours)
      end

      let!(:premium_offer2) do
        create(:offer, :premium,
              advertiser_name: 'p2', start_at: Time.zone.now - 3.hours)
      end

      let!(:normal_offer1) do
        create(:offer,
              advertiser_name: 'n1', start_at: Time.zone.now - 2.hours)
      end

      let!(:normal_offer2) do
        create(:offer,
              advertiser_name: 'n2', start_at: Time.zone.now - 1.hours)
      end

      it 'should list the offers in order' do
        expect(subject.to_a).to eql([premium_offer2, premium_offer1, normal_offer2, normal_offer1])
      end
    end
  end
end