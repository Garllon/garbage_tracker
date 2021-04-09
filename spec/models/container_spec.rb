# frozen_string_literal: true

require 'rails_helper'

describe Container, type: :model do
  it 'needs a user to exist' do
    expect(Container.new).to be_invalid
  end

  context 'having a valid user' do
    subject { Container.new(user: valid_user) }

    let(:valid_user) { FactoryBot.build(:user) }

    it { is_expected.to be_invalid }

    context 'having a name' do
      subject { Container.new(user: valid_user, name: valid_name) }

      let(:valid_name) { 'dust bin' }

      it { is_expected.to be_invalid }

      context 'having a weight' do
        it 'does not accept anything thats not a number' do
          c = Container.new(user: valid_user, name: valid_name, weight: 'abc')
          expect(c).to be_invalid
        end

        it 'accepts a number as weight' do
          c = Container.new(user: valid_user, name: valid_name, weight: 123)
          expect(c).to be_valid
        end
      end
    end
  end
end
