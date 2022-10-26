require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User tests" do

    it "should save when all required fields are filled" do
      @user = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password: "test",
        password_confirmation: "test"
      })
      @user.save
      expect(@user).to be_valid
    end

    it "should have a missing first name error" do
      @user = User.new({
        last_name: "Doe",
        email: "testemail@test.com",
        password: "test",
        password_confirmation: "test"
      })
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should have a missing last name error" do
    @user = User.new({
      first_name: "John",
      email: "testemail@test.com",
      password: "test",
      password_confirmation: "test"
    })
    @user.save
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end
    
    it "should have a missing email error" do
      @user = User.new({
        first_name: "John",
        last_name: "Doe",
        password: "test",
        password_confirmation: "test"
      })
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should have a missing password error" do
      @user = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password_confirmation: "test"
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should have a missing password confirmation error" do
      @user = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password: "test",
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end


    it "should have a password and password confirmation do not match error" do
      @user = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password: "test",
        password_confirmation: "nottest"
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it "should have a email in use error" do
      @user = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password: "test",
        password_confirmation: "test"
      })
      @user.save
      @dupeUser = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password: "test",
        password_confirmation: "test"
      })
      @dupeUser.save
      expect(@dupeUser.errors.full_messages).to include("Email has already been taken")
    end


    it "should have a password too short error" do
      @user = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password: "t",
        password_confirmation: "t"
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end
  end


  describe '.authenticate_with_credentials' do
    it "should confirm created user is the same as logged in user" do
      @user = User.new({
      first_name: "John",
      last_name: "Doe",
      email: "testemail@test.com",
      password: "test",
      password_confirmation: "test"
      })
      @user.save
      expect(User.authenticate_with_credentials("testemail@test.com", "test")).to be_truthy
    end

    it "should work with white space before and after email" do
      @user = User.new({
      first_name: "John",
      last_name: "Doe",
      email: "testemail@test.com",
      password: "test",
      password_confirmation: "test"
      })
      @user.save
      expect(User.authenticate_with_credentials(" testemail@test.com ", "test")).to be_truthy
    end

    it "should be case insensitive" do
        @user = User.new({
        first_name: "John",
        last_name: "Doe",
        email: "testemail@test.com",
        password: "test",
        password_confirmation: "test"
      })
      @user.save
      expect(User.authenticate_with_credentials("TESTEMAIL@test.com", "test")).to be_truthy
    end
  end

end
