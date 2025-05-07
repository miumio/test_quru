puts "Clearing database..."
[ Answer, Question, TestResult, Test, Category, User ].each(&:destroy_all)

puts "Creating categories..."
categories = {
  programming: "Программирование",
  web: "Web-разработка",
  db: "Базы данных"
}

users_names = [ "John Snow", "Tyrion Lannister", "Joffrey Baratheon" ]

categories_records = Category.create!(
  categories.values.map { |title| { title: title } }
)

puts "Creating users..."
users = User.create!(
  users_names.map { |name| { name: name } }
)

puts "Creating tests..."
test_data = [
  { title: "Основы Ruby", level: 1, category: categories_records[0], user: users.first },
  { title: "SQL: базовые запросы", level: 2, category: categories_records[2], user: users.last },
  { title: "HTML и CSS", level: 1, category: categories_records[1], user: users.last },
  { title: "Rails для начинающих", level: 2, category: categories_records[1], user: users.first }
]

tests = Test.create!(test_data)

puts "Creating questions & answers..."
questions_answers = {
  "Основы Ruby" => [
    { body: "Как объявить символ в Ruby?", answers: [ ":symbol", "\"symbol\"", "@symbol", "&symbol" ], correct: 0 },
    { body: "Какой метод используется для итерации по массиву в Ruby?", answers: [ "each", "forEach", "loop", "iterate" ], correct: 0 },
    { body: "Что такое блоки (blocks) в Ruby?", answers: [ "Анонимные функции, которые можно передавать методам", "Объекты класса Block", "Участки кода внутри условий if-else", "Инициализаторы переменных" ], correct: 0 }
  ],
  "SQL: базовые запросы" => [
    { body: "Какой запрос используется для выборки данных из таблицы?", answers: [ "SELECT", "EXTRACT", "OBTAIN", "GET" ], correct: 0 },
    { body: "Как объединить две таблицы в SQL?", answers: [ "JOIN", "MERGE", "COMBINE", "UNION" ], correct: 0 },
    { body: "Для чего используется оператор WHERE?", answers: [ "Для фильтрации результатов запроса", "Для сортировки результатов запроса", "Для группировки результатов запроса", "Для объединения таблиц" ], correct: 0 }
  ],
  "HTML и CSS" => [
    { body: "Какой тег используется для создания заголовка первого уровня?", answers: [ "<h1>", "<header>", "<title>", "<heading>" ], correct: 0 },
    { body: "Как указать внешний CSS-файл в HTML?", answers: [ "<link rel=\"stylesheet\" href=\"styles.css\">", "<style src=\"styles.css\">", "<css import=\"styles.css\">", "<script type=\"css\" src=\"styles.css\">" ], correct: 0 },
    { body: "Что такое CSS-селектор?", answers: [ "Шаблон для выбора элементов, к которым будут применяться стили", "Функция JavaScript для выбора элементов DOM", "Специальный тег HTML для определения стилей", "Атрибут для указания стилей непосредственно в HTML" ], correct: 0 }
  ]
}

questions_answers.each do |test_title, questions|
  test = Test.find_by(title: test_title).id
  questions.each do |q|
    question = Question.create!(body: q[:body], test_id: test)
    q[:answers].each_with_index do |answer, index|
      Answer.create!(body: answer, correct: index == q[:correct], question_id: question.id)
    end
  end
end

puts "Creating passed tests..."

tests_passed = [
  { test_progress: 15, test: tests.first, user: users.first },
  { test_progress: 2, test: tests[1], user: users.first },
  { test_progress: 35, test: tests[2], user: users.last },
  { test_progress: 95, test: tests[3], user: users.last }
]

tests_passed.each do |test|
  TestResult.create!(test)
end

puts "Seeding completed successfully!"
