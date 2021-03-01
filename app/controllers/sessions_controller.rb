class SessionsController < ApplicationController
    helper_method :logged_in?

    def new
    end

    def create
        if params[:name].nil? || params[:name].empty?
            redirect_to login_path
        else
            session[:name] = params[:name]
            redirect_to '/'
        end
    end

    def destroy
        session.delete :name
    end

    private

    def logged_in
        !!session[:name]
    end

    def session_params
        params.require(:name)
    end
end