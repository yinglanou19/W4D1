class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end

    def show
        @user = User.find_by(id: params[:id])
        
        unless @user.nil?
            render json: @user
        else
            render json: 'User does not exist.', status: :unprocessable_entity
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        
        unless @user.nil?
            @user.update(user_params)
            render json: @user
        else
            render json: 'User does not exist.', status: :unprocessable_entity
        end      
    end

    def destroy
        @user = User.find_by(id: params[:id])
        
        unless @user.nil?
            @user.delete
            render json: "#{@user.name} was deleted"
        else
            render json: 'User does not exist.', status: :unprocessable_entity
        end  
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end
