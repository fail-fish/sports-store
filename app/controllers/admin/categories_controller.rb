class Admin::CategoriesController < InheritedResources::Base
  before_action :authenticate_admin!

  respond_to :html

  def create
    create!(notice: 'Category added!') { admin_categories_path }
  end

  def update
    update!(notice: 'Category updated!') { admin_categories_path }
  end

  def destroy
    destroy!(notice: 'Category removed!') { admin_categories_path }
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
