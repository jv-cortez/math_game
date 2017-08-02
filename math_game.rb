require './player'

class Game
  
  puts "--------------"
  puts "---||--||-----"
  puts "---||--||-----"
  puts "---||--||-O---"
  puts "---||==||-|---"
  puts "---||--||-|---"
  puts "---||--||-|---"
  puts "---||--||-|---"
  puts "--------------"


  #start of game
  def initialize
    puts "Player 1 please insert your name"
    @player1 = Player.new(gets.chomp)

    puts "Player 2 please insert your name"
    @player2 = Player.new(gets.chomp)

    @turn = @player1
    puts "----------------------"
    puts "------START-GAME------"
    puts "----------------------"
    gameflow
  end

  #questions
  def question
    num1 = rand(1..30)
    num2 = rand(1..30)
    @question = "What does #{num1} + #{num2} equal to?"
    @answer = num1 + num2
  end

  #turns
  def turn
    @turn
  end

  def current_turn
    puts "#{@turn.name}: #{@question}?"
    player_answer = gets.chomp
    if player_answer.to_i === @answer
      puts "#{@turn.name}: You got it!"
    else
      puts "#{@turn.name}: Sorry, wrong!"
      @turn.damage
    end
    puts "#{@player1.name}: #{@player1.health}/3 vs #{@player2.name}: #{@player2.health}/3"
  end

  #game over logic
  def game_over
    if @player1.health <= 0
      puts "#{@player2.name} wins with a score of #{@player2.health}/3"
      puts "-----------------"
      puts "----GAME-OVER----" 
      puts "-----------------"
    else
      puts "#{@player1.name} wins with a score of #{@player1.health}/3"
      puts "-----------------"
      puts "----GAME-OVER----" 
      puts "-----------------"  
    end
  end

  #flow
  def switch_turns
    if @turn == @player1
      @turn = @player2
    else
      @turn = @player1
    end
    puts "----------------"
    puts "----NEW-TURN----"
    puts "----------------"
  end

    def gameflow
      until @player1.health <= 0 || @player2.health <= 0
        question
        current_turn
        switch_turns
      end
      game_over
    end
end

game = Game.new