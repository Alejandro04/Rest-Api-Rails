module Api
    module V1
        class ArticlesController < ApplicationController
          #before_action :authenticate_user!
          before_action :set_articles, only: [:show, :update, :destroy]

          def index
            @articles = Article.all
        
            render json: @articles
          end
        
          def show
            render json: @articles
          end
        
          def create
            @article = Article.new(article_params)
        
            if @article.save
              render json: @article, status: :created
            else
              render json: @article.errors, status: :unprocessable_entity
            end
          end
        
          def update
            if @article.update(article_params)
              render json: @article
            else
              render json: @article.errors, status: :unprocessable_entity
            end
          end
        
          def destroy
            @article.destroy
          end        
      
            private
            def set_articles
              @article = Article.find(params[:id])
            end

            def article_params
                params.permit(:title, :body, :category_id)
            end

        end
    end
end