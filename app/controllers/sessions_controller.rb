class SessionsController < ApplicationController

    def new
    end

    def create
        # if !params[:name] || params[:name].empty?
        #     return redirect_to(controller: 'sessions', action: 'new')
        # else
        #     session[:name] = params[:name]
        # end

        # @user = User.find_by(userame: params[:username])
        # return head(:forbidden) unless @user.authenticate(params[:password])
        # session[:user_id] = @user.id

        user = User.find_by(name: params[:user][:name])
        authenticated = user.try(:authenticate, params[:user][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless authenticated
        @user = user
        session[:user_id] = @user.id
        redirect_to(controller: 'welcome', action: 'home')
    end

end