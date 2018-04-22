class VacationsController < ApplicationController

before_action :set_customer
before_action :set_Transports, :convert_vacation_params, :set_customer_vacation, only: [:show, :update, :destroy]
# GET /customers/:customer_id/vacations
def index
json_response(@customer.vacations)
end
# GET /customers/:customer_id/vacations/:id
def show
json_response(@vacation)
end
def set_Transports
    @Transports = Vacation.Transports
  end

  def set_issue_types
    @issue_types = Vacation.issue_types
  end

  def set_priorities
    @priorities = Vacation.priorities
  end

def convert_vacation_params
  params[:priority]=params[:priority].to_i
  params[:issue_type]=params[:issue_type].to_i
  params[:status]=params[:status].to_i
end

# POST /customers/:customer_id/vacations
def create
@customer.vacations.create!(vacation_params)
json_response(@vacation, :created)
end
# PUT /customers/:customer_id/vacations/:id
def update
  @vacation = @customer.vacations.find_by!(id: params[:id]) if @customer
  if @vacation.update_attributes(vacation_params)
    json_response(@vacation, :update)
      else
        json_response(@vacation, :update)
      end
  #head :no_content


 @vacation.update(vacation_params)
 head :no_content
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
