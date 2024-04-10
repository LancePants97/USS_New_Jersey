require 'spec_helper'

RSpec.describe Board do

  describe '#initialize' do
    it 'exists' do
      expect(board = Board.new).to be_a(Board)
    end
  end

  describe '#cells' do
    it 'has correct number of cells' do
      board = Board.new
      expect(board.cells["A1"]).to be_a(Cell)
    end
  end

  describe '#coordinate?' do
    it 'has valid coordinates' do
      board = Board.new
      board.cells
      expect(board.valid_coordinate?("A1")).to be true
      expect(board.valid_coordinate?("D4")).to be true
      expect(board.valid_coordinate?("A5")).to be false
      expect(board.valid_coordinate?("E1")).to be false
      expect(board.valid_coordinate?("A22")).to be false
    end
  end

  describe '#valid_placement?' do
    before do
      @board = Board.new
      @board.cells
    end

    it 'can check #same_number' do
      expect(@board.same_number(["A1", "B1"])).to be true
      expect(@board.same_number(["A1", "B2"])).to be false
    end

    it 'can check #same_letter' do
      expect(@board.same_letter(["A1", "B1"])).to be false
      expect(@board.same_letter(["A1", "A2"])).to be true
    end

    it 'can check #consecutive_numbers' do
      expect(@board.consecutive_numbers(["A1", "B4"])).to be false
      expect(@board.consecutive_numbers(["A1", "B1"])).to be false
      expect(@board.consecutive_numbers(["A2", "A3"])).to be true
    end

    it 'can check #consecutive_letters' do
      expect(@board.consecutive_letters(["A1", "B4"])).to be true
      expect(@board.consecutive_letters(["A1", "C1"])).to be false
      expect(@board.consecutive_letters(["A2", "A3"])).to be false
    end

    it 'can check #ship_length against coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false

      cruiser = Ship.new("Cruiser", 3)
      expect(board.valid_placement?(cruiser, ["A2", "A3", "A4"])).to be true
    end

    it 'can invalidate ship placements based on nonconsecutive coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
    end

    it 'can invalidate ship placements based on diagonal' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false
    end

    it 'can validate ship placements based on validation conditions passing' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
    end

    it 'can validate that ships do not overlap' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "B1"])).to be false
    end

    it 'can validate ship placements based on validation conditions passing' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true 
    end

  end

  describe 'board.place' do
    it 'can place ships in cells' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      expect(cell_1.ship == cell_2.ship).to be true
      expect(cell_3.ship == cell_2.ship).to be true
    end
  end

  describe '#render' do
    xit 'can render the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end

end