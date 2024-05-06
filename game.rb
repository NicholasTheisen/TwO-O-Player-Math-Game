class Game
  attr_accessor :current_player, :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    { question: "What does #{num1} plus #{num2} equal?", answer: num1 + num2 }
  end

  def check_answer
    answer = gets.chomp.to_i
    if answer == @num1 + @num2
      puts "Correct!"
    else
      puts "Incorrect!"
      @current_player.lose_life
    end
  end

  def print_scores
    puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
  end

  def run
    while @player.alive? && @player2.alive?
      question = generate_question
      check_answer
      print_scores
      switch_player
    end
    winner = @player1.alive? ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
  end
end 