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
        password:"12345678",
        password_confirmation:"123456789"
      )
      expect(@user.valid?).to be_falsy
    end




  end
  



end
