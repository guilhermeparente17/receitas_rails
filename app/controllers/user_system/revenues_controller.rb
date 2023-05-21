class UserSystem::RevenuesController < UserSystemController
  before_action :set_revenue, only: [:edit]
  before_action :set_category_type, only: [:new, :create, :edit]

  def index
    @revenues = current_user.revenues.all
  end

  def edit
  end

  def new
    @revenue = Revenue.new
  end

  def create
    @revenue = current_user.revenues.build(params_revenue) # Cria um novo objeto Revenue associado ao usuário atual
    if @revenue.save # Salva a receita no banco de dados
      redirect_to user_system_revenues_path, notice: "Receita criada com sucesso!"
    else
      render :new
    end
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

  def set_category_type
    @category_options = Category.all.pluck(:description, :id)
  end

  def params_revenue
    params.require(:revenue).permit(:title, :description, :category_id)
  end
end
