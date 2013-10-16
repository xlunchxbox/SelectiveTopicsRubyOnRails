class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]

  def index
    @work_order = WorkOrder.new
    #@work_orders = WorkOrder.all
    @work_orders = WorkOrder.search(params[:search])
  end

  def show
  end

  def new
    @work_order = WorkOrder.new
  end

  def edit
  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    if @work_order.save
      @work_orders = WorkOrder.all
    end
  end

  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        format.html { redirect_to @work_order, notice: 'Work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @work_order.destroy
      @work_orders = WorkOrder.all
    end
  end
  
  private
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    def work_order_params
      params.require(:work_order).permit(:details, :status, :worker_id)
    end
end
