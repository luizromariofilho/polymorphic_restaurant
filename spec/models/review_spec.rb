require 'rails_helper'

RSpec.describe Review, type: :model do
  
  it { should have_db_column(:reviewable_id).of_type(:integer) }
  it { should have_db_column(:reviewable_type).of_type(:string) }

  it { should belong_to(:reviewable) }

  context "validations" do
  	subject { create(:review_on_restaurant) }

  	it "is valid with valid attributes" do
	    should be_valid
	 	end	

	 	it "is not valid without a comment" do 
	    should validate_presence_of(:comment)
	  end

	  it "is not valid without a reviewable" do 
	    should validate_presence_of(:reviewable_type)
	    should validate_presence_of(:reviewable_id)
	  end
  end
end
