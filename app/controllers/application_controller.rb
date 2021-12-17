class ApplicationController < ActionController::API
  include ActionController::Cookies
before_action :bird, only:[:index,  :show, :create, :destroy, :increment_likes, :update]


end

private

      def bird
        Bird.find_by(id: params[:id])
      end
      def bird_params
        params.permit(:name, :species, :likes)
      end
      
      def render_not_found_response
        render json: { error: "Bird not found" }, status: :not_found
      end
    
