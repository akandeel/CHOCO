class BusinessesControllerController < ApplicationController

  def new
    @businesse = @Businesse.new
  end

  def show

  end


  def create
    @businesse = Businesse.new(businesse_params)
    if @businesse.save
      redirect_to dashboard_path
    else
      render 'business_sign_up' #might have to figure this redirect_to later.
      
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def businesse_params
    params.require(:businesse).permit(:business_name,
                                      :directors_name,
                                      :country,
                                      :street_number,
                                      :street_name,
                                      :province,
                                      :unit_number,
                                      :mailing_address,
                                      :email_address,
                                      )
    end
  end


end
