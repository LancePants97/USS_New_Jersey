require 'spec_helper'

RSpec.describe Cell do

    it 'exists' do
        expect(cell = Cell.new("B4")).to be_a(Cell)
    end

    it 'has a coordinate' do
        cell = Cell.new("B4")
        expect(cell.coordinate).to eq("B4")
    end
    

end