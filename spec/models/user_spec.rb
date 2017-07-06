require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:likes) }
  it { should have_many(:notes) }
  it { should have_many(:followers) }
  it { should have_many(:following) }  
end
