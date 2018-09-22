module Admin
class BusinessesController < BaseController
  before_action :set_business, only: [:profile, :update]

  def profile
    @time_zone = ActiveSupport::TimeZone::MAPPING
  end

  def update
    if @business.update(business_params)
      redirect_to profile_admin_businesses_path,
                  notice: 'Business was successfully updated.'
    else
      render :profile
    end
  end



  private
    def set_business
      @business = current_business
    end

    def business_params
      params.require(:business).permit(:business_name, :first_name, :last_name, :phone, :email, :address, :city, :state, :country, :time_zone)
    end
end
end
