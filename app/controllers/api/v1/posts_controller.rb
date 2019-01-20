module Api
    module V1
        class PostsController < ApplicationController
          before_action :set_posts, only: [:show, :update, :destroy]

          def index
            @posts = Post.all
        
            render json: @posts
          end
        
          def show
            render json: @post
          end
        
            private
            def set_posts
              @post = Post.find(params[:id])
            end

            def post_params
                params.permit(:title, :body, :category_id)
            end

        end
    end
end