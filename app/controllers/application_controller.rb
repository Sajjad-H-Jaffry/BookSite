class ApplicationController < ActionController::Base
    before_action :authenticate_user!, only: [:new, :edit]   

    include Pundit
    protect_from_forgery with: :exception
rescue_from Pundit::NotAuthorizedError do 
redirect_to root_url, alert: "you dont have acess to this page"
end

end
