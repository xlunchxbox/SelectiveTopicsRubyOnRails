class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
    @worker = Worker.new
    @workers = Worker.all
  end

  def show
  end

  def new
    @worker = Worker.new
  end

  def edit
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      @workers = Worker.all
    end
  end

  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @worker.destroy
      @workers = Worker.all
    end
  end

  private
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:first_name, :last_name)
    end
end
