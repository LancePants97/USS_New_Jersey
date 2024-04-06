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

        it 'can add a ship and fill a cell' do
            cell = Cell.new("B4")
            cruiser = Ship.new("Cruiser", 3)

            expect(cell.empty?).to be(true)
            
            cell.place_ship(cruiser)
            
            expect(cell.ship).to eq(cruiser)

            expect(cell.empty?).to be(false)
        end

        it 'is not fired upon by default' do
            cell = Cell.new("B4")
            cruiser = Ship.new("Cruiser", 3)

            expect(cell.fired_upon?).to be(false)
        end

        it 'it can be fired upon' do
            cell = Cell.new("B4")
            cruiser = Ship.new("Cruiser", 3)

            expect(cell.fired_upon?).to be(false)

            cell.fire_upon

            expect(cell.fired_upon?).to be(true)
        end

        it 'it can be fired upon' do
            cell = Cell.new("B4")
            cruiser = Ship.new("Cruiser", 3)

            cell.place_ship(cruiser)

            expect(cell.fired_upon?).to be(false)
            expect(cell.ship.health).to eq(3)

            cell.fire_upon

            expect(cell.fired_upon?).to be(true)
            expect(cell.ship.health).to eq(2)
        end

end