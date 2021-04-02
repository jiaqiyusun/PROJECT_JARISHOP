class WelcomeController < ApplicationController
  def index
    def index
      fetch_home_data
      
      @products = Product.all
      #@products = Product.onshelf.page(params[:page] || 1).per_page(params[:per_page] || 12).order("id desc").includes(:main_product_image)
    end
  end
end
