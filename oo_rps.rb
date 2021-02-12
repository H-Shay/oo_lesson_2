class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    if rock?
      return other_move.scissors?
    end
    if paper?
      return other_move.rock?
    end
    if scissors?
      return other_move.paper?
    end
  end

  def <(other_move)
    if rock?
      return other_move.paper?
    end
    if paper?
      return other_move.scissors?
    end
    if scissors?
      return other_move.rock?
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    @move = nil
    set_name
  end
end

class Human < Player
  def set_name
    answer = ""
    loop do
      puts "What miserable excuse for a name shall we call you?"
      answer = gets.chomp
      break unless answer.empty?
      puts "You are worthless. Enter a name."
    end
    self.name = answer
  end

  def choose
    choice = nil
    loop do
      puts "Your move, Earthling."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "This is why your planet will be destroyed. Choose either rock, paper or scissors,
      crayon-eater."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = 'Vogon Wrecking Crew'
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Vogon RPS. Zoning regulation zero-oh-fournteen-snixty states that you can
    save earth if you beat us in a game of rock, paper, scissors. Prepare to be annihilated."
  end

  def display_goodbye_message
    puts "Good riddance puny human! You have ten minutes until Earth is destroyed."
  end

  def display_winner
    puts "#{human.name} foolishly chose #{human.move}!"
    puts "The #{computer.name} have wisely chosen #{computer.move}!"

    if human.move > computer.move
      puts "You clearly cheated! You lose!"
    elsif human.move < computer.move
      puts "You lose! Earth will be annihilated and you must listen to our poetry!"
    else
      puts "You have chosen the same as us but we are superior! You lose!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to lose-I mean play-again? Enter y/n, if that's not too complicated for you."
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
    end
    answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
