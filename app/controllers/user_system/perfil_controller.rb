class UserSystem::PerfilController < UserSystemController
  before_action :set_user, only: [:edit, :update]

  def index
  end

  def edit
    
  end

  def update
    if @user.update params_user
      redirect_to root_path, notice: "Usuário atualizado com  sucesso!"
    end
  end

  private 

  def set_user
    id = params[:id]
    @user = User.find(id)
  end

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
