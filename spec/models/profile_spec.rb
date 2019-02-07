require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'should test that the factory is valid' do
    expect(FactoryBot.build :profile).to be_valid
  end

  it 'shoud validate the presence of a name' do
    profile = FactoryBot.build :profile, name: ''
    expect(profile).not_to be_valid
    expect(profile.errors.messages[:name]).to include("can't be blank")
  end

  it 'should validate the presence of a location' do
    profile = FactoryBot.build :profile, location: ''
    expect(profile.errors.messages[:location]).to eq([])
  end
end
