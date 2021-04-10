# frozen_string_literal: true

require 'rails_helper'

describe Pile, type: :model do
  subject(:pile) { build(:pile) }

  it 'has an valid weight' do
    expect(pile).to be_valid
  end

  it 'has an invalid weight' do
    pile.weight = 'abc'
    expect(pile).to be_invalid
  end

  it 'has an invalid produced_at' do
    pile.produced_at = nil
    expect(pile).to be_invalid
  end

  it 'has an invalid kind' do
    pile.kind = nil
    expect(pile).to be_invalid
  end

  it 'has an invalid user' do
    pile.user = nil
    expect(pile).to be_invalid
  end
end
