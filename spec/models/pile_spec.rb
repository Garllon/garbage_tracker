# frozen_string_literal: true

require 'rails_helper'

describe Pile, type: :model do
  subject(:pile) do
    described_class.new(user: user,
                        container: container,
                        kind: kind,
                        produced_at: produced_at,
                        weight: weight)
  end

  let(:user) { nil }
  let(:container) { nil }
  let(:kind) { nil }
  let(:produced_at) { nil }
  let(:weight) { nil }

  it 'needs a user to exist' do
    expect(pile).to be_invalid
  end

  context 'having a valid user' do
    let(:user) { build(:user) }

    it { is_expected.to be_invalid }

    context 'having a valid container' do
      let(:container) { build(:container, user: user) }

      it { is_expected.to be_invalid }

      context 'having a valid kind' do
        let(:kind) { :bio }

        it { is_expected.to be_invalid }

        context 'having a valid produced_at' do
          let(:produced_at) { Date.today }

          it { is_expected.to be_invalid }

          context 'having a weight' do
            it 'does not accept anything thats not a number' do
              pile.weight = 'abc'
              expect(subject).to be_invalid
            end

            it 'accepts a number as weight' do
              pile.weight = 100
              expect(subject).to be_valid
            end

            it 'has a real_weight after save' do
              pile.weight = 1000
              expected_value = pile.weight - container.weight
              subject.save
              expect(subject.reload.real_weight).to be expected_value
            end
          end
        end
      end
    end
  end
end
