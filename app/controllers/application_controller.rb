class ApplicationController < ActionController::Base
    before_action :authenticate_user!, only: [:new, :edit]   

    include Pundit::Authorization

end
