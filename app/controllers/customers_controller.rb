class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params.require(:customer).permit(:first_name, :last_name, :company, :phone1, :phone2, :email, :address, :comment))
      redirect_to customer_url(@customer), notice: 'Updated A Customer'
    else
      render :edit
    end
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params.require(:customer).permit(:first_name, :last_name, :company, :phone1, :phone2, :email, :address, :comment))
    if @customer.save
      redirect_to customer_url(@customer), notice: 'Created A New Customer'
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

end
