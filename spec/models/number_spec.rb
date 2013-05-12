require 'spec_helper'

describe Number do
  it { should allow_mass_assignment_of(:code) }
  it { should allow_mass_assignment_of(:value) }

  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }
  it { should validate_presence_of(:value) }
end
