class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_paramters ,if: :devise_controller?

  def login_required
  	if current_user.blank?
  		respond_to do |format|
  			format.html{
  				authenticate_user!
  			}
  			format.js{
  				render :partial =>"common/not_logined"
  			}
  			format.all{
  				head(:unauthorized)
  			}
  		end
  	end	
  end






  protect_from_forgery with: :exception

  protected
  def configure_permitted_paramters
  	devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:name,:emil,:password,:password_confirmation)}
  	
  end



end
