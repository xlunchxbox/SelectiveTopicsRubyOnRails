class SearchController < ApplicationController
  def search_results
    @work_orders = WorkOrder.where("status = ?", params[:search])
  end
end
