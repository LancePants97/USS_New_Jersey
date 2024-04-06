require 'spec_helper'

RSpec.describe Ship do

  it 'exists' do
    expect(cruiser = Ship.new("Cruiser", 3)).to be_a(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
  end
  
  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)
  end
  
  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end
  
  it 'is not sunk' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to be false
  end
  
  it 'reduces health when hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end
  
  it 'reduces health when hit again' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to be false
  end
  
  it 'can be sunk' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to be true
  end

end