class UserSystem::CategoriesController < UserSystemController
  before_action :set_category, only: [:edit, :destroy, :update]

  def index
    @categories = Category.all
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create params_category
    if @category.save # Salva a receita no banco de dados
      redirect_to user_system_categories_path, notice: "Categoria criada com sucesso!"
    else
      render :new
    end
  end
  

  def update
    if @revenue.update(params_revenue)
      redirect_to user_system_categories_path, notice: "Categoria atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to user_system_categories_path, notice: "Categoria apagada com sucesso!"
    else
      render :index
    end
  end

  private

  def set_category
    id = params[:id]
    @category = Category.find(id)
  end

  def params_category
    params.require(:category).permit(:description)
  end
end
