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
        find_user
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
        find_user
        if @user.update(user_params)
            redirect_to users_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        find_user
            if @user.destroy
                redirect_to root_path
            else
                redirect_to root_path, status: :see_other
            end
    end

    private
        def find_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:name,:mobile,:city,:password,:confirmPassword)
        end
end