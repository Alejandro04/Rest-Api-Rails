module Api
    module V1
        class SubcategoriesController < ApplicationController
            def index
                subcategories = Subcategory.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded subcategories', data:subcategories},status: :ok
            end

            def show
                subcategory = Subcategory.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded subcategory', data:subcategory},status: :ok
            end

            def create
                subcategory = Subcategory.new(subcategory_params)
                
                if subcategory.save
                    render json: {status: 'SUCCESS', message: 'Loaded subcategory', data:subcategory},status: :ok
                else
                    render json: {status: 'ERROR', message: 'SubCategory not saved', 
                    data:subcategory.errors},status: :unprocessable_entity
                end   
            end

            def destroy 
                subcategory = Subcategory.find(params[:id])
                subcategory.destroy
                render json: {status: 'SUCCESS', message: 'Deleted subcategory', data:subcategory},status: :ok
            end

            def update
                subcategory = Subategory.find(params[:id])
                if subcategory.update_attributes(subcategory_params)
                    render json: {status: 'SUCCESS', message: 'Updated subcategory', data:subcategory},status: :ok
                else
                    render json: {status: 'ERROR', message: 'SubCategory not updated', 
                    data:subcategory.errors},status: :unprocessable_entity
                end   
            end

            private

            def subcategory_params
                params.permit(:name, :category_id)
            end
        end
    end
end