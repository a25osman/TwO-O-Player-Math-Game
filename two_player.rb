class Player
  attr_accessor :lives
  
  def initialize
    @lives = 3
  end

  def is_alive
    if @lives > 0
      return true
    else
      return false
    end
  end

end

class Questions
  attr_reader :num1, :num2
  def initialize
    @num1 = rand(0..20)
    @num2 = rand(0..20)
  end
  def answer
    return @num1 + @num2
  end
end

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @turn = ["Player1", @player2, @player1]
  end

  def play
    puts "helooooo"
    while @player1.is_alive && @player2.is_alive
      question = Questions.new
      puts "#{@turn[0]}: What does #{question.num1} plus #{question.num2} equal?"
      guess = gets.chomp.to_i
      # puts guess

      if guess == question.answer
        puts "#{@turn[0]}: YES! You are correct."
      else
        @turn[1].lives -= 1
        puts "#{@turn[0]}: Nope!"
      end

      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      
      if @player1.is_alive && @player2.is_alive
        puts "\n----- NEW TURN -----"
        if @turn[0] == "Player1"
          @turn = ["Player2", @player1, @player2]
        elsif @turn[0] == "Player2"
          @turn = ["Player1", @player2, @player1]
        end
      end

    end

    puts "\n#{@turn[0]} wins with a score of #{@turn[2].lives}/3"
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end
end

game = Game.new
game.play