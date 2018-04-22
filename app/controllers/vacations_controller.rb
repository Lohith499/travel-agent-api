class VacationsController < ApplicationController
  before_action :set_customer
  before_action :set_customer_vacation, only: [:show, :update, :destroy]
  # GET /customers/:customer_id/vacations
  def index
    json_response(@customer.vacations)
  end
  # GET /customers/:customer_id/vacations/:id
  def show
    json_response(@vacation)
  end
  # POST /customers/:customer_id/vacations
  def create
    @customer.vacations.create!(vacation_params)
    json_response(@customer, :created)
  end
  # PUT /customers/:customer_id/vacations/:id
  def update
    #@vacation.update(vacation_params)
    #head :no_content
    @vacation = @customer.vacations.find_by!(id: params[:id]) if @customer
    if @vacation.update_attributes(vacation_params)
      json_response(@vacation, :update)
    else
      json_response(@vacation, :update)
    end
  end
  # DELETE /customers/:customer_id/vacations/:id
  def destroy
    @vacation.destroy
    head :no_content
  end
  private
  def vacation_params
    params.permit(:title, :article, :likes, :status)
  end
  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
  def set_customer_vacation
    @vacation = @customer.vacations.find_by!(id: params[:id]) if @customer
  end
end
