class LikesController < ApplicationController
  before_action :find_sandwich, only: [:create, :destroy]
  before_action :find_like, only: [:destroy]

 def create
   byebug
   @sandwich.likes.create(user_id: current_user.id)
   redirect_to sandwich_path(@sandwich)
 end

 def destroy
   byebug
   @like.destroy
   redirect_to sandwich_path(@sandwich)
 end

 def like_destroy_all
   current_user.likes.each do |like|
     if like != nil
       like.destroy
     end
   end
   redirect_to users_path
 end


# Private helper methods
 private

 def find_sandwich
   @sandwich = Sandwich.find(params[:sandwich_id])
 end

 def find_like
   @like = @sandwich.likes.find_by(sandwich_id: params[:sandwich_id], user_id: current_user.id)
end
end
