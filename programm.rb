current_path = File.dirname(__FILE__) + "/data/"

begin
  results = File.readlines(current_path + "results.txt", encoding: "UTF-8")
  questions = File.readlines(current_path + "questions.txt", encoding: "UTF-8")
rescue SystemCallError
  abort "Ошибка чтения файла в директории #{current_path}"
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
