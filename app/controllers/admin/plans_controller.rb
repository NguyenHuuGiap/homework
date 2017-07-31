class Admin::PlansController < ApplicationController
  before_action :load_plans, only: :index
  before_action :load_products, only: [:new, :edit]
  before_action :load_plan, only: [:show, :edit, :update, :destroy]

  def index; end

  def show
    respond_to(&:js)
  end

  def new
    @plan = Plan.new
    respond_to(&:js)
  end

  def create
    plan = Plan.new plan_params
    if plan.save
      flash[:success] = t "messages.create_success"
    else
      flash[:danger] = t "messages.create_fail"
    end
    redirect_to admin_plans_path
  end

  def edit
    respond_to do |format|
      format.js{render "new.js.erb"}
    end
  end

  def update
    if @plan.update_attributes plan_params
      flash[:success] = t "messages.update_success"
    else
      flash[:danger] = t "messages.update_fail"
    end
    redirect_to admin_plans_path
  end

  def destroy
    if @plan.destroy
      flash[:success] = t "messages.delete_success"
    else
      flash[:danger] = t "messages.delete_fail"
    end
    redirect_to admin_plans_path
  end

  private
  def load_products
    @products = Product.all
  end

  def load_plans
    @plans = Plan.page(params[:page]).per Settings.per_page.plan
  end

  def load_plan
    @plan = Plan.find_by id: params[:id]
    redirect_to admin_plans_path, flash: {danger: t("messages.load_data_fail")} unless @plan
  end

  def plan_params
    params.require(:plan).permit :name, :product_id
  end
end
