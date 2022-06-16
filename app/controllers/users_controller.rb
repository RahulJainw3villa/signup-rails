class UsersController < ApplicationController
    before_action :edit, only: [:edit,:show,:update,:destroy]
    
    def index
        @users = User.all
    end

    def projects
        @user = User.find(params[:id])
        @project = @user.projects.all
    end

   
    def new
        @user  = User.new 
    end

    def edit 
        @user = User.find(params[:id])
    end

    def show
        find_user
    end

    def create
        @user = User.new(user_params)
            if @user.save
                redirect_to users_path
            else
                render  :new, :status, :unprocessable_entity  
            end    
    end 

    def update
        @user = User.find(params[:id])
        if @user.update!(user_update_params)
            redirect_to @user
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
         
    end

    private
        def find_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:name,:mobile,:city,:password,:confirmPassword)
        end

        def user_update_params
            params.require(:user).permit(:name,:mobile,:city)
        end

end