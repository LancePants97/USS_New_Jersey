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
    if ship_length(ship, coordinates) && same_letter(coordinates) && consecutive_numbers(coordinates) #horizontal
      true
    elsif
      ship_length(ship, coordinates) && same_number(coordinates) && consecutive_letters(coordinates) #vertical
      true
    else #diagonal
      false
    end
  end

  def ship_length(ship, coordinates)
    ship.length == coordinates.length
  end

  def same_number(coordinates)
    coordinates.each_cons(2).all? do |num|
       num[0].chars[1] == num[1].chars[1]
    end
  end

  def same_letter(coordinates)
    coordinates.each_cons(2).all? do |letter|
      letter[0].chars[0] == letter[1].chars[0]
   end
  end

  def consecutive_numbers(coordinates)
    coordinates.each_cons(2).all? do |num|
      num[1].chars[1].to_i - num[0].chars[1].to_i == 1
    end
  end

  def consecutive_letters(coordinates)
    coordinates.each_cons(2).all? do |letter|
      letter[1].ord - letter[0].ord == 1
    end
  end

end

  # ["A1", "A2", "A3"] #letter has to be the same && number has to be consecutive - horizontal
  # ["A1", "B1", "C1"] #letter has to be consecutive && number has to be the same - vertical
  # ["A1", "B2", "C3"] #letter consecutive && number consecutive NOT VALID (Diagonal) FALSE

  # if letter the same (true) && number consecutive (true) THEN valid
  # elsif number the same (true) && letter consecutive (true) THEN valid
  # else FALSE

   #look at each pair of consecutive coordinates
    #(array of 2 strings)
    #compare the first element 2nd char
    #to the 2nd element 2nd char
