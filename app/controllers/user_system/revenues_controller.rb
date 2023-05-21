class UserSystem::RevenuesController < UserSystemController
  before_action :set_revenue, only: [:edit]

  def index
    @revenues = current_user.revenues.all
  end

  def edit
  end

  def update
    @revenue = current_user.revenues.find(params[:id])
    if @revenue.update(params_revenue)
      redirect_to user_system_revenues_path, notice: "Receita atualizada com sucesso!"
    else
      render :edit
    end
  end

  private

  def set_revenue
    id = params[:id]
    @revenue = Revenue.find(id)
  end

  def params_revenue
    params.require(:revenue).permit(:title, :description)
  end
end
