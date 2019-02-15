class LikesController < ApplicationController
  before_action :find_sandwich, only: [:create, :destroy]
  before_action :find_like, only: [:destroy]

 def create
   @sandwich.likes.create(user_id: current_user.id)
   redirect_to sandwich_path(@sandwich)
 end

 def destroy
   @like.destroy
   redirect_to sandwich_path(@sandwich)
 end

 def like_destroy_all
   current_user.likes.each do |likes|
     if likes != nil
       likes.destroy
     end
   end
   redirect_to users_path
 end

 private

 def find_sandwich
   @sandwich = Sandwich.find(params[:sandwich_id])
 end

 def find_like
   @like = @sandwich.likes.find(params[:sandwich_id])
end
end
