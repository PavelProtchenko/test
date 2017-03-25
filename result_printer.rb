class ResultPrinter
  def initialize(score, results)
    @score = score
    @results = results

    print_result
  end

  def print_result
    if @score >= 30
      puts @results[0]
    elsif @score >= 25 && @score <= 29
      puts @results[1]
    elsif @score >= 19 && @score <= 24
      puts @results[2]
    elsif @score >= 14 && @score <= 18
      puts @results[3]
    elsif @score >= 9 && @score <= 13
      puts @results[4]
    elsif @score >= 4 && @score <= 8
      puts @results[5]
    else
      puts @results[6]
    end
  end
end