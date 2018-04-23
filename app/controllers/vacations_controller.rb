class VacationsController < ApplicationController

before_action :set_customer
before_action :set_Transports, :convert_vacation_params, :set_customer_vacation, only: [:show, :update, :destroy]
# GET /customers/:customer_id/vacations
def index
json_response(@customer.vacations.sort_by { |st| st['id'].to_i })
end
# GET /customers/:customer_id/vacations/:id
def show
json_response(@vacation)
end
def set_Transports
    @Transports = Vacation.Transports
  end

def convert_vacation_params
  params[:Transport]=params[:Transport].to_i
end

# POST /customers/:customer_id/vacations
def create
@cvacation=@customer.vacations.create!(vacation_params)
json_response(@cvacation, :created)
end
# PUT /customers/:customer_id/vacations/:id
def update
  @vacation = @customer.vacations.find_by!(id: params[:id]) if @customer
  if @vacation.update_attributes(vacation_params)
    json_response(@vacation, :updated)
      else
        json_response(@vacation, :updated)
      end
  #head :no_content
end
# DELETE /customers/:customer_id/vacations/:id
def destroy
@vacation.destroy
head :no_content
end
private

def vacation_params
params.permit(:Place, :Date, :Description, :Budget, :Transport, :Image)
end
def set_customer
@customer = Customer.find(params[:customer_id])
end

def set_customer_vacation
@vacation = @customer.vacations.find_by!(id: params[:id]) if @customer
end
end
