require 'spec_helper'

RSpec.describe Cell do

    describe '#initialize' do
        it 'exists' do
            expect(cell = Cell.new("B4")).to be_a(Cell)
        end

        it 'has a coordinate' do
            cell = Cell.new("B4")
            expect(cell.coordinate).to eq("B4")
        end
    end


        it 'has no ship by default' do
            cell = Cell.new("B4")
            expect(cell.ship).to eq(nil)
        end

        it 'is empty by default' do
            cell = Cell.new("B4")
            expect(cell.empty?).to be(true)
        end

        # it 'is empty by default' do
        #     cell = Cell.new("B4")
        #     cruiser = Ship.new("Cruiser", 3)

        #     cell.place_ship(cruiser)

        #     expect(cell.empty?).to be(false)
        # end
    

end