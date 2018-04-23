class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :update, :destroy]
  # GET /customers
  def index
  @customers = Customer.all.sort_by { |st| st['id'].to_i }
  json_response(@customers)
  end
  # POST /customers
  def create
  @customer = Customer.create!(customer_params)
  json_response(@customer, :created)
  end
  # GET /customers/:id
  def show
  json_response(@customer)
  end
  # PUT /customers/:id
  def update
  #@customer.update(customer_params)
  @customer = Customer.find(params[:id])
  if @customer.update_attributes(customer_params)
      render :json => @customer
      else
        render :json => { :errors => @customer.errors.full_messages }, :status => 422
      end

    #json_response(@customer, :updated)
    #  else
    #    json_response(@customer, :updated)
    #  end
  #head :no_content
  end
  # DELETE /customers/:id
  def destroy
  if @customer.destroy
  render :json => {:message => "Deleted Successfull"}, :status => 200
  else
    render :json => { :errors => @customer.errors.full_messages }, :status => 422
  end
  #head :no_content
  end
  private
  def customer_params
  # whitelist params
  params.permit(:FirstName, :LastName, :Phone, :Address, :TravelAgent_email)
  end
  def set_customer
  @customer = Customer.find(params[:id])
  end
  end
