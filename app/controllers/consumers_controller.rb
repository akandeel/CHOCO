class ConsumersController < ApplicationController

  def new
    @consumer = Consumer.new
  end

  def create
    @consumer = Consumer.new(consumer_params)
    if @consumer.save
      alert[:flash] = "Your chocolate path begins..."
      redirect_to '/pages/home'
    else
      render '/consumers/new'
    end
  end

  def update
  end

  def show
    @consumer = Consumer.find(params:[id])
    # @sales = @consumer.sales YOU NEED AFTER SALES MODEL IS MADE.
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
