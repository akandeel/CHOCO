class ConsumersController < ApplicationController


  def show
   @consumer = Consumer.find(params:[id])
   # @sales = @consumer.sales YOU NEED AFTER SALES MODEL IS MADE.
 end

  def new
    #@consumer = Consumer.new
  end

  def create
    @consumer = Consumer.new(consumer_params)
    if @consumer.save
      log_in @consumer
      flash[:success] = "You are logged in!"
      redirect_to @consumer #notice: ""
    else
      render '/consumers/new'
    end
  end

  def edit
    @consumer = Consumer.find(params[:id])
  end

  def update
    @consumer = Consumer.find(params[:id])
    if @consumer.update_attributes(consumer_params)
        redirect_to(:action => 'show', :id=> @consumer.id)
      else
        render 'edit'
    end
  end


  def destroy
  end

private

def consumer_params
  params.require(:consumer).permit(

                                :first_name,
                                :last_name,
                                :gender,
                                :date_of_birth,
                                :country,
                                :street_number,
                                :street_name,
                                :state,
                                :suit,
                                :mailing_address
                                )
  end
end
