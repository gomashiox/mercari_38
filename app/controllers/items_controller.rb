class ItemsController < ApplicationController

  def index
  end


  def new
    @item = Item.new
   end

  # Ajax処理を行う処理
  def get_category_ms
    render partial: 'select_category_m', locals: {category_l_id: params[:category_l_id]}
  end

  def get_category_ss
    render partial: 'select_category_s', locals: {category_m_id: params[:category_m_id]}
  end

  def show
  end

  def create
    @item = Item.new(item_params)
  end

 private
  def item_params
    params.require(:item).permit(:name, :image_url, :description, :category_l_id, :category_m_id, :category_s_id, :condition, :shipping_fee, :arrived_date, :size_id, :price)
  end

end
