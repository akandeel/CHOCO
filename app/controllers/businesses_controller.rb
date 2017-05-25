class BusinessesControllerController < ApplicationController

  def new
    @businesse = @Businesse.new
  end

  def show
    @businesse = Businesse.find(params[:id])
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
    @businesse = Businesse.find(params[:id])
  end

  def update
    @businesse = Businesse.find(params[:id])
    if @businesse.update_attributes(businesse_params)
      redirect_to edit_path
    else
      render 'edit'
    end
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
