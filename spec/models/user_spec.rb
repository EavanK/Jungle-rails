require "rails_helper"

RSpec.describe User, type: :model do

  describe "Validations" do

    before do
      @admin_user = User.create!(
        :first_name => "Hyunsu",
        :last_name => "Kim",
        :email => "TEST@TEST.com",
        :password => "password",
        :password_confirmation => "password"
      )
      @user = User.new(
        :first_name => "Eavan",
        :last_name => "Kim",
        :email => "eavan@gmail.com",
        :password => "password",
        :password_confirmation => "password"
      )
    end

    it "should save successfully" do
      expect(@user.save).to be true
      expect(@user.errors.full_messages).to be_empty
      expect(@user).to have_attributes(
        :first_name => "Eavan",
        :last_name => "Kim",
        :email => "eavan@gmail.com",
        :password => "password",
        :password_confirmation => "password"
      )
    end

    # validation of user's name
    context "of name" do
      it "should return an error message when first name is blank" do
        @user.first_name = nil

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it "should return an error message when last name is blank" do
        @user.last_name = nil
        
        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    # validation of email
    context "of email" do
      it "should return error messages when eamil is blank" do
        @user.email = nil

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email is invalid")
      end

      it "should return an error message when email is invalid" do
        @user.email = "eavan@gmail"

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "should return an error message when email has white spaces" do
        @user.email = " eavan@gmail.com "

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "should return an error message if email already exists" do
        @user.email = "test@test.COM"

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
    end

    # validation of password
    context "of password" do
      it "should return an error message when passwords are blank" do
        @user.password = nil
        @user.password_confirmation = nil

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "should return an error message when passwords don't match" do
        @user.password_confirmation = "pass1231"

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "should return an error message when passwords are too short" do
        @user.password = "pass"
        @user.password_confirmation = "pass"

        expect(@user.save).to be false
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end

  # validate user authentication
  describe ".authenticate_with_credentials" do

    before do
      @admin_user = User.create!(
        :first_name => "Hyunsu",
        :last_name => "Kim",
        :email => "TEST@TEST.com",
        :password => "password",
        :password_confirmation => "password"
      )
    end
    
    it "should allow login with the wrong case email" do
      @user = User.authenticate_with_credentials("tesT@TesT.COm", "password")

      expect(@user).to eql(@admin_user)
    end

    it "should allow login with white spaces before/after email" do
      @user = User.authenticate_with_credentials("  tesT@TesT.COm  ", "password")
      
      expect(@user).to eql(@admin_user)
    end
  end
end
