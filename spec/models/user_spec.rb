require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    context "basic validations" do
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

    context "username specific validations" do
      it 'username should be unique' do
        user = User.new(username: "bugs", email: 'bugs@example.com', password: "password3")
        user.save
        u = User.new(username: "bugs", email: 'bunny@example.com', password: "password4")
        expect(u.errors.messages[:username]).to eq([])
      end
    end

    context "password  specific validations" do
      it 'should not be valid with a short answer' do
        user = User.new password: 'short'
        expect(user).not_to be_valid
      end
    end

    context "email specific validations" do
      it 'email should be unique' do
        user = User.new(username: "bugs", password:"password2", email: 'bugs@example.com')
        user.save
        u = User.new(username: "bunny", password: "password3", email: "bugs@example.com")
        u.save
        expect(u.errors.messages[:email]).to eq(['has already been taken'])
      end

      it 'should validate the email format' do
         u = User.new(username: "bunny", password: "password3", email: "bugsexample.com")
        u.save
        expect(u.errors.messages[:email]).to eq(['is invalid'])
      end

      it 'has no errors for valid email format' do
        user = User.new(username: "disney", email: 'bugs@disney.com', password: '123456789')
        user.save
        expect(user.errors.messages[:email]).to eq([])
      end
    end

   


  end
end
