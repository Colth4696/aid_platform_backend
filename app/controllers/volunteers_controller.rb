class VolunteersController < ApplicationController
    def index
        @volunteers = Volunteer.all
        if @volunteers
          render json: {
            volunteers: @volunteers
          }
        else
          render json: {
            status: 500,
            errors: ['no volunteers found']
          }
        end
    end
    def show
        @volunteer = Volunteer.find(params[:id])
       if @volunteer
          render json: {
            volunteer: @volunteer
          }
        else
          render json: {
            status: 500,
            errors: ['volunteer not found']
          }
        end
      end
    def create
        @volunteer = Volunteer.new(volunteer_params)
        if @volunteer.save
          render json: {
            status: :created,
            volunteer: @volunteer
          }
        else 
          render json: {
            status: 500,
            errors: @volunteer.errors.full_messages
          }
        end
      end
      
    private
      
      def volunteer_params
        params.require(:volunteer).permit(:user_id, :request_id)
      end
    end
