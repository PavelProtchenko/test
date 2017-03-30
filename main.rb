current_path = File.dirname(__FILE__)
results_path = current_path + "/data/results.txt"
questions_path = current_path + "/data/questions.txt"

begin
  f = File.new(results_path, "r:UTF-8")
  results = f.readlines
  f.close
rescue SystemCallError
  abort "Файл с результатами не найден: #{results_path}"
end

begin
  f = File.new(questions_path, "r:UTF-8")
  questions = f.readlines
  f.close
rescue SystemCallError
  abort "Файл с вопросами не найден: #{questions_path}"
end

require_relative "lib/test"
require_relative "lib/result_printer"

username = ARGV[0]
username = username.encode("UTF-8") if Gem.win_platform? && ARGV[0]
username = "Секретный агент" if username == nil

puts "Привет, #{username}! Ответьте на следующие вопросы теста: "

test = Test.new(questions)

puts "\n #{username}"
puts "\nВаш результат (количество баллов): #{test.score}"

ResultPrinter.new(test.score, results)
