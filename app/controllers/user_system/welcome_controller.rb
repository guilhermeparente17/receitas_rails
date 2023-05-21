class UserSystem::WelcomeController < UserSystemController
  def index
    @revenues = current_user.revenues.all.size
  end
end
