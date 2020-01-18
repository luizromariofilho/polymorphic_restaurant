require 'rails_helper'

RSpec.describe Review, type: :model do
  
  it { should have_db_column(:reviewable_id).of_type(:integer) }
  it { should have_db_column(:reviewable_type).of_type(:string) }

  it { should belong_to(:reviewable) }
end
