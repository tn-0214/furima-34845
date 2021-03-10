class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def items_params
    params.require(:item).permit(:name, :comment, :category_id, :condition_id, :postage_id, :ship_form_id, :etd_id, :price,:image).merge(user_id: current_user.id)
  end


end
