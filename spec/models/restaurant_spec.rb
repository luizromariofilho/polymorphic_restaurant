require 'rails_helper'
require 'models/concerns/reviewable_spec'

RSpec.describe Restaurant, type: :model do
  it_behaves_like "reviewable"
end
