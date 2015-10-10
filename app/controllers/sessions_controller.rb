class SessionsController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id, :email)
    end
    
    def new
    end

    def create
        user = User.find_by(user_params)
        if user
            session[:session_token] = user.session_token
            redirect_to movies_path
        else
            flash[:notice] = "Invalid user-id or E-mail."
            redirect_to login_path
        end
    end
    
    def destroy
        reset_session
        redirect_to movies_path
    end

end