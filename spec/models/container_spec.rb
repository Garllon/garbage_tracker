# frozen_string_literal: true

require 'rails_helper'

describe Container, type: :model do
  subject(:container) { build(:container) }

  it 'has valid data' do
    expect(container).to be_valid
  end

  it 'has an invalid weight' do
    container.weight = 'abc'
    expect(container).to be_invalid
  end

  it 'has no weight' do
    container.weight = nil
    expect(container).to be_invalid
  end

  it 'has no name' do
    container.name = nil
    expect(container).to be_invalid
  end

  it 'has no user' do
    container.user = nil
    expect(container).to be_invalid
  end
end
