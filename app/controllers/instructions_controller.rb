class InstructionsController < ApplicationController

    def index
        instructors = Instructor.all
        render json: instructor
    end
 
    def show
        instructor = Instructor.find_by(id: params[:id])
    
        if instructor
          render json: instructor, only: [:id, :name]
        else
          render json: { error: "instructor not found" }, status: :not_found
        end
      end

end
