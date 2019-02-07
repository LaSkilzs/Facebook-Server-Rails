require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should test that a factory is valid' do
    expect(FactoryBot.build :user).to be_valid
  end

  it 'should validate the presence of a username' do
    user = FactoryBot.build :user, username: ''
    expect(user).not_to be_valid
    expect(user.errors.messages[:username]).to include("can't be blank")
  end

  it 'should validate the presence of a password' do
    user = FactoryBot.build :user, password_digest: '' 
    expect(user).not_to be_valid
    expect(user.errors.messages[:password]).to include("can't be blank")
  end

  it 'should validate the presence of a email address' do
    user = FactoryBot.build :user, email: ''
    expect(user).not_to be_valid
    expect(user.errors.messages[:email]).to include("can't be blank")
  end
end
