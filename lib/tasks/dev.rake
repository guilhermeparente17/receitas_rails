namespace :dev do

  DEFAULT_PASSWORD = 123123

  desc "TODO"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") {%x(rails db:drop)}
      show_spinner("Criando BD...") {%x(rails db:create)}
      show_spinner("Migrando BD...") {%x(rails db:migrate)}
      show_spinner("Criando usuário padrão...") {%x(rails dev:add_user_default)}
    else
      puts "Você não está no ambiente de desenvolvimento"
    end
  end

  desc "Adicionar usuário padrão"
  task add_user_default: :environment do
    User.create!(
      email: "admin@admin.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
