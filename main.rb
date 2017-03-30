current_path = File.dirname(__FILE__)
results_path = current_path + "/data/results.txt"
questions_path = current_path + "/data/questions.txt"

if File.exist?(results_path)
  f = File.new(results_path, "r:UTF-8")
  results = f.readlines
  f.close
else
  abort "Файл с результатами не найден"
end

if File.exist?(questions_path)
  f = File.new(questions_path, "r:UTF-8")
  questions = f.readlines
  f.close
else
  abort "Файл с вопросами не найден"
end

require_relative "lib/test"
require_relative "lib/result_printer"

username = ARGV[0]

if Gem.win_platform? && ARGV[0]
  username = username.encode("UTF-8")
end

if username == nil
  username = "Секретный агент"
end

puts "Привет, #{username}! Ответьте на следующие вопросы теста: "

test = Test.new(questions)

puts "\n #{username}"
puts "\nВаш результат (количество баллов): #{test.total_score}"

ResultPrinter.new(test.total_score, results)
