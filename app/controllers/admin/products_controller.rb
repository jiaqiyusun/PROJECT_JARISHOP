class Admin::ProductsController < Admin::BaseController

    before_action :find_product, only: [:edit, :update, :destroy]
  
    def index
      @products = Product.page(params[:page] || 1).per_page(params[:per_page] || 10)
        .order("id desc")
    end
  
    def new
      @product = Product.new
      @colors = []
      @product.product_characteristics.build
      @root_categories = Category.roots
      @colors = select_option Color
      @sizes =  select_option Size
      
      @status = [[Product::Status::On, '上架'], [Product::Status::Off, '下架']]
      
    end
  
    def create
      @product = Product.new(params_product)
      @root_categories = Category.roots
      
      if @product.save
        flash[:notice] = "创建成功"
        redirect_to admin_products_path
      else
        render action: :new
      end
    end
  
    def edit
      @root_categories = Category.roots
      render action: :new
    end
  
    def update
      @product.attributes = params.require(:product).permit!
      @root_categories = Category.roots
      if @product.save
        flash[:notice] = "修改成功"
        redirect_to admin_products_path
      else
        render action: :new
      end
    end
  
    def destroy
      if @product.destroy
        flash[:notice] = "删除成功"
        redirect_to admin_products_path
      else
        flash[:notice] = "删除失败"
        redirect_to :back
      end
    end
  
    private
    def find_product
      @product = Product.find(params[:id])
    end

    def params_product
      params.require(:product).permit(
        :category_id, :title, :amount, :uuid, :msrp, :price, :description,
        :product_characteristics_attributes => [:size_id, :color_id, :amount]
      )
    end

    def select_option model_s
      colec =[]
      model_s.select(:id, :name).each do |single|
        colec << [ single.name, single.id ]
      end
      colec
    end
  end