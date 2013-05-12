require 'spec_helper'

describe Contact do
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:position) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
