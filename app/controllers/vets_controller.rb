class VetsController < ApplicationController

    def index
      @vets = Vet.all.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    end
  
    def new
      @vet = Vet.new
    end
  
    def create
      @vet = Vet.new(vet_params)
      if @vet.save
        redirect_to vets_path
      else
        render 'new'
      end
    end
  
    def show
      @vet = Vet.find(params[:id])
      @vet_comment = VetComment.new
      @vet_comments = @vet.vet_comments.includes(:user).order("created_at DESC")
    end
  
    private
    def vet_params
      params.require(:vet).permit(:vet_image, :vet_title, :vet_text).merge(user_id: current_user.id)
    end
  end

