require('spec_helper')
describe Player do
  it{ should have_many(:spaces)}
  it{ should belong_to(:game)}
end
