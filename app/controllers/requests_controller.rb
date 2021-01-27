class RequestsController < ApplicationController
    def index
        @requests = Request.all
        if @requests
          render json: {
            requests: @requests
          }
        else
          render json: {
            status: 500,
            errors: ['no requests found']
          }
        end
    end
    def show
        @request = Request.find(params[:id])
       if @request
          render json: {
            request: @request
          }
        else
          render json: {
            status: 500,
            errors: ['request not found']
          }
        end
      end
    def create
        @request = Request.new(request_params)
        @request.user_id = session[:user_id]
        if @request.save
          render json: {
            status: :created,
            request: @request
          }
        else 
          render json: {
            status: 500,
            errors: @request.errors.full_messages
          }
        end
      end
      
    private
      
      def request_params
        params.require(:request).permit(:title, :description, :latitude, :longitude, :category)
      end
    end
