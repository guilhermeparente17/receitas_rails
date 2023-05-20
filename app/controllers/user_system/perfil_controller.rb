class UserSystem::PerfilController < UserSystemController
  before_action :authenticate_user!
  before_action :verify_password, only: [:update]

  def index
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_system_perfil_index_path, notice: "Usuário atualizado com sucesso!"
    else
      render :edit, notice: "teste"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end 
  end
end
