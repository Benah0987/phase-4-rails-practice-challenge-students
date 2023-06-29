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
    # adding a new instructor
    def create
        instructor = Instructor.new(instructor_params)
    
        if instructor.save
          render json: instructor, status: :created
        else
          render json: { errors: instructor.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # destroy an instructor
    def destroy
        student = @instructor.students.find(params[:id])
        student.destroy
        head :no_content
      end
      


    private
    
      def instructor_params
        params.permit(:name)
      end




end
