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






  end
  



end
