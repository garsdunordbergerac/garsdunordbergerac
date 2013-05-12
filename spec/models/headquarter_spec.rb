require 'spec_helper'

describe Headquarter do
  it { should allow_mass_assignment_of(:city) }
  it { should allow_mass_assignment_of(:latitude) }
  it { should allow_mass_assignment_of(:longitude) }
  it { should allow_mass_assignment_of(:postcode) }
  it { should allow_mass_assignment_of(:street) }
  it { should allow_mass_assignment_of(:title) }

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:postcode) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:title) }
end
