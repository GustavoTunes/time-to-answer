namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Setup database"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping DB...") {%x(rails db:drop)}
      show_spinner("Creating DB...") {%x(rails db:create)}
      show_spinner("Migrating DB...") {%x(rails db:migrate)}
      show_spinner("Adding Admin...") {%x(rails dev:add_default_admin)}
      show_spinner("Adding User...") {%x(rails dev:add_default_user)}
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

  desc "Add default user"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(start_text)
    spinner = TTY::Spinner.new("[:spinner] #{start_text}")
    spinner.auto_spin
    yield
    spinner.success("(Successful!)")
  end
end