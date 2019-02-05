module Api
    module V1
        class SubcategoriesController < ApplicationController
          before_action :authenticate_user!
          before_action :set_subcategory, only: [:show, :update, :destroy]

          def index
            @subcategories = Subcategory.all
        
            render json: @subcategories
          end
        
          def show
            render json: @subcategory
          end
        
          def create
            @subcategory = Subcategory.new(subcategory_params)
        
            if @subcategory.save
              WelcomeMailer.notify(@subcategory).deliver_now

              render json: @subcategory, status: :created
            else
              render json: @subcategory.errors, status: :unprocessable_entity
            end
          end
        
          def update
            if @subcategory.update(subcategory_params)
              render json: @subcategory
            else
              render json: @subcategory.errors, status: :unprocessable_entity
            end
          end
        
          def destroy
            @subcategory.destroy
          end        
      
            private
            def set_subcategory
              @subcategory = Subcategory.find(params[:id])
            end

            def subcategory_params
                params.permit(:name, :category_id)
            end

        end
    end
end