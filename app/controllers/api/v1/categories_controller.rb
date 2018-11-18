module Api
    module V1
        class CategoriesController < ApplicationController
            def index
                categories = Category.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded categories', data:categories},status: :ok
            end

            def show
                category = Category.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded category', data:category},status: :ok
            end

            def create
                category = Category.new(category_params)
                
                if category.save
                    render json: {status: 'SUCCESS', message: 'Loaded category', data:category},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Category not saved', 
                    data:category.errors},status: :unprocessable_entity
                end   
            end

            def destroy 
                category = Category.find(params[:id])
                category.destroy
                render json: {status: 'SUCCESS', message: 'Deleted category', data:category},status: :ok
            end

            def update
                category = Category.find(params[:id])
                if category.update_attributes(category_params)
                    render json: {status: 'SUCCESS', message: 'Updated category', data:category},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Category not updated', 
                    data:category.errors},status: :unprocessable_entity
                end   
            end

            def subcategories
                subcategories = Category.find(params[:id]).subcategories
                render json: {status: 'SUCCESS', message: 'Subcategories', data:subcategories},status: :ok
            end

            private

            def category_params
                params.permit(:name)
            end
        end
    end
end