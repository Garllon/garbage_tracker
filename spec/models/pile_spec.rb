# frozen_string_literal: true

require 'rails_helper'

describe Pile, type: :model do
  it 'needs a user to exist' do
    expect(Pile.new).to be_invalid
  end

  context 'having a valid user' do
    let(:valid_user) { build(:user) }
    subject { Pile.new(user: valid_user) }

    it { should be_invalid }

    context 'having a valid container' do
      let(:valid_container) { build(:container, user: valid_user) }
      subject { Pile.new(user: valid_user, container: valid_container) }

      it { should be_invalid }
    end
  end
end
