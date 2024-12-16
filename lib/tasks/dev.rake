namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Setup database"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping DB...") {%x(rails db:drop)}
      show_spinner("Creating DB...") {%x(rails db:create)}
      show_spinner("Migrating DB...") {%x(rails db:migrate)}
      show_spinner("Adding Default Admin...") {%x(rails dev:add_default_admin)}
      show_spinner("Adding Extra Admins...") {%x(rails dev:add_extra_admins)}
      show_spinner("Adding Default User...") {%x(rails dev:add_default_user)}
      show_spinner("Adding Default Subjects...") {%x(rails dev:add_subjects)}
      show_spinner("Adding Default Questions and answers...") {%x(rails dev:add_questions_answers)}

    else
      puts "Not on the development environment!"
    end
  end

  desc "Add default admin"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Add extra admins"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Add default user"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Add default subjects"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)
   
    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Add default questions and answers"
  task add_questions_answers: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do |i|
        params = create_question_params(subject)
        answers_array = params[:question][:answers_attributes]

        add_answers(answers_array)
        elect_true_answer(answers_array)

        Question.create!(params[:question])
      end
    end
  end

  private

  def create_question_params(subject = Subject.all.sample)
    {question: {
        description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
        subject: subject,
        answers_attributes: []
      }
    }
  end

  def create_answer_params(correct = false)
    {description: Faker::Lorem.sentence, correct: correct }
  end

  def add_answers(answers_array = [])
    rand(2..5).times do |j|
      answers_array.push(
        create_answer_params
      )
    end
  end

  def elect_true_answer(answers_array = [])
    selected_index = rand(answers_array.size)
    answers_array[selected_index] = create_answer_params(true)
  end

  def show_spinner(start_text)
    spinner = TTY::Spinner.new("[:spinner] #{start_text}")
    spinner.auto_spin
    yield
    spinner.success("(Successful!)")
  end
end