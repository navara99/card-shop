require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    it "should create the user if all fields are valid" do
      @user = User.new(
        first_name: "Jesus",
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password:"12345678",
        password_confirmation:"12345678"
      )

      expect(@user.valid?).to be_truthy
    end

    it "should NOT create the user if password and password_confirmation do not match" do
      @user = User.new(
        first_name: "Jesus",
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password: "12345678",
        password_confirmation: "123456789"
      )

      expect(@user.valid?).to be_falsy
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it "should NOT create the user if the password is not at least 8 characters" do
      @user = User.new(
        first_name: "Jesus",
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password: "1234",
        password_confirmation: "1234"
      )

      expect(@user.valid?).to be_falsy
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 8 characters)")
    end

    it "should NOT create the user if password is not present" do
      @user = User.new(
        first_name: "Jesus",
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password: nil,
        password_confirmation: "123456789"
      )

      expect(@user.valid?).to be_falsy
      expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
    end

    it "should NOT create the user if password_confirmation is not present" do
      @user = User.new(
        first_name: "Jesus",
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password: "12345678",
        password_confirmation: nil
      )

      expect(@user.valid?).to be_falsy
      expect(@user.errors.full_messages[0]).to eq("Password confirmation can't be blank")
    end

    it "should NOT create the user if the email already exists" do
      @user = User.new(
        first_name: "Jesus",
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
      @user.save

      @user2 = User.new(
        first_name: "John",
        last_name: "Cena",
        email: "JesusDBarnum@dayrep.com",
        password: "12345678abc",
        password_confirmation: "12345678abc"
      )

      expect(@user2.valid?).to be_falsy
      expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
    end

    it "should NOT create the user if first_name is not present" do
      @user = User.new(
        first_name: nil,
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password: "123456789",
        password_confirmation: "123456789"
      )

      expect(@user.valid?).to be_falsy
      expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
    end

    it "should NOT create the user if last_name is not present" do
      @user = User.new(
        first_name: "John",
        last_name: nil,
        email: "JesusDBarnum@dayrep.com",
        password: "123456789",
        password_confirmation: "123456789"
      )

      expect(@user.valid?).to be_falsy
      expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
    end

    it "should NOT create the user if email is not present" do
      @user = User.new(
        first_name: "John",
        last_name: "Barnum",
        email: nil,
        password: "123456789",
        password_confirmation: "123456789"
      )

      expect(@user.valid?).to be_falsy
      expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
    end

  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user = User.new(
        first_name: "John",
        last_name: "Barnum",
        email: "JesusDBarnum@dayrep.com",
        password: "123456789",
        password_confirmation: "123456789"
      )

      @user.save
    end
    
    it "should return nil if password is incorrect" do
      expect(User.authenticate_with_credentials("JesusDBarnum@dayrep.com", "abcdefghi")).to be_falsy
    end

    it "should return truthy value if password is correct" do
      expect(User.authenticate_with_credentials("JesusDBarnum@dayrep.com", "123456789")).to be_truthy
    end

    it "should return falsy value if email does not exist in database" do
      expect(User.authenticate_with_credentials("TESTEMAIL@dayrep.com", "123456789")).to be_falsy
    end

    it "should return truthy value if email and password are correct but there are extra spaces before/after email" do
      expect(User.authenticate_with_credentials("    JesusDBarnum@dayrep.com ", "123456789")).to be_truthy
    end

    it "should return truthy value if email and password are correct but the email has the wrong case" do
      expect(User.authenticate_with_credentials("jesusdbarnum@dayrep.com", "123456789")).to be_truthy
    end

  end
  
end
