class Test
  def initialize(questions)
    @score = 0
    @questions = questions
    ask
  end

  def ask
    for item in @questions
      puts item
      user_input = nil

      until user_input == 1 || user_input == 2 || user_input == 3
        puts "Введите ответ 1 - (если да); 2 - (если нет); 3 - (если иногда)"
        user_input = STDIN.gets.to_i
      end
      check_input(user_input)
    end
  end

  def check_input(user_input)
    if user_input == 1
      @score += 2
    elsif user_input == 3
      @score += 1
    end
  end

  def total_score
    @score
  end
end