require 'rails_helper'

RSpec.shared_examples "reviewable" do
	it { should have_many(:reviews) }
end	