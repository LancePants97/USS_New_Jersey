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
    if coordinates_empty(coordinates) && ship_length(ship, coordinates) && same_letter(coordinates) && consecutive_numbers(coordinates) #horizontal
      true
    elsif coordinates_empty(coordinates) && ship_length(ship, coordinates) && same_number(coordinates) && consecutive_letters(coordinates)  #vertical
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

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @board_hash[coordinate].place_ship(ship)
    end 
  end

  def coordinates_empty(coordinates)
    coordinates.all? do |coordinate|
      @board_hash[coordinate].empty?
    end
  end

  def render
    start = "  1 2 3 4 \nA "
    all_cells = @board_hash.values.map do |cell|
        cell.render #single cell render
      end
    all_cells_joined = all_cells.join(" ")
    render_string = start + all_cells_joined #get one string of each rendered cell
    binding.pry
  end

end

  #"  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

    #start = "  1 2 3 4 \nA "
    #concat each of the following lines
    #values.render of [A1]..[A4] aka all_cells[0], [1], [2], [3]
    #\nB
    #values.render of [B1]..[B4]
    #\nC
    #values.render of [C1]..[C4]
    #\nD
    #values.render of [D1]..[D4]



  #we're getting array of strings (of each rendered cell). 
  #need to make the array one string, and insert spaces, and static rows/columns and "\n"

