class ConsumersController < ApplicationController

  def new
    @consumer = Consumer.new
  end

  def create
  end

  def update
  end

  def show
  end

  def destroy
  end

private

def consumer_params
  params.require(:consumer).permit(:first_name)











end
