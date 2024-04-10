class Board

  def initialize
    @board_hash = cells
  end

  def cells 
      {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(cell_coordinate)
    @board_hash.keys.include?(cell_coordinate)
  end
    
  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length && evaluate_consecutive_numbers(coordinates)
  end

  def evaluate_consecutive_numbers(coordinates)
    coordinates.each_cons(2).all? do |num|
      num[1].chars[1].to_i - num[0].chars[1].to_i == 1
    end
  end

end

["A1", "A2", "A3"] #letter has to be the same && number has to be consecutive
["A1", "B1", "C1"] #letter has to be consecutive && number has to be the same
["A1", "B2", "C3"] 