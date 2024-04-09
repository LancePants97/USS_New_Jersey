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
	end

	describe '#fired_upon?' do
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

	describe '#render' do
		it 'can render as an empty cell' do
			cell_1 = Cell.new("B4")
			cruiser = Ship.new("Cruiser", 3)

			expect(cell_1.render).to eq('.')
		end

		it 'can render an empty cell that is fired upon' do
			cell_1 = Cell.new("B4")
			cruiser = Ship.new("Cruiser", 3)

			expect(cell_1.render).to eq('.')

			cell_1.fire_upon

			expect(cell_1.render).to eq('M')
		end

		it 'can render a cell containing a ship, not fired upon' do
			cell_2 = Cell.new("C3")
			cruiser = Ship.new("Cruiser", 3)

			expect(cell_2.render).to eq('.')
			# binding.pry

			cell_2.place_ship(cruiser)
			# binding.pry
			expect(cell_2.render).to eq('.')
			# binding.pry
			expect(cell_2.render(true)).to eq('S')
		end

		it 'can render a cell containing a ship that is hit' do
			cell_2 = Cell.new("C3")
			cruiser = Ship.new("Cruiser", 3)

			expect(cell_2.render).to eq('.')

			cell_2.place_ship(cruiser)
			cell_2.fire_upon

			expect(cell_2.fired_upon).to be(true)
			expect(cell_2.render).to eq("H")
		end

		it 'can render a cell containing a ship that sunk' do
			cell_2 = Cell.new("C3")
			cruiser = Ship.new("Cruiser", 3)

			expect(cell_2.render).to eq('.')

			cell_2.place_ship(cruiser)
			cell_2.fire_upon

			expect(cell_2.fired_upon).to be(true)
			expect(cell_2.render).to eq("H")
			expect(cruiser.sunk?).to be(false)

			cell_2.fire_upon
			cell_2.fire_upon

			expect(cruiser.sunk?).to be(true)
			expect(cell_2.render).to eq("X")
			end
		end
end