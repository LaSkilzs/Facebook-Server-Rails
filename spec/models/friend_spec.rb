require 'rails_helper'

RSpec.describe Friend, type: :model do
  it 'should test the factory is valid' do
    expect(FactoryBot.build :friend).to be_valid
 end

#  it 'should test that friend belongs to user' do
#     user = FactoryBot.create(:user)
#     friend = FactoryBot.create(:friend, user_id: user.id )
#     expect(friend).to belong_to(:user)
#  end
end
