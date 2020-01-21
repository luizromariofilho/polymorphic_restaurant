require 'rails_helper'
require 'models/concerns/reviewable_spec'

RSpec.describe Restaurant, type: :model do
  it_behaves_like "reviewable"

  

  # before(:all) do
  #   @restaurant = create(:restaurant)
  # end
  
  context "validations" do 

  	subject { create(:restaurant) }
	  
	  it "is valid with valid attributes" do
	    should be_valid
	  end
	  
	  it "has a unique name" do
	    should validate_uniqueness_of(:name)
	  end
	  
	  it "is not valid without a name" do 
	    should validate_presence_of(:name)
	  end

	  it "has a unique phone" do
	    should validate_uniqueness_of(:phone)
	  end
	  
	  it "is not valid without a phone" do 
	    should validate_presence_of(:phone)
	  end

  end
end
