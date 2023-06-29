class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students
  end

  def show
    student = Student.find_by(id: params[:id])

    if student 
      render json: student, only: [:id, :name, :age, :major]
    else
      render json: { error: "student not found" }, status: :not_found
    end
  end

  def create
    student = Student.new(student_params)

    if student.save
      render json: student, status: :created, only: [:id, :name, :age, :major]
    else
      render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
    end
end

def update
  student = Student.find_by(id: params[:id])

  if student
    if student.update(student_params)
      render json: student, only: [:id, :name, :age, :major]
    else
      render json: { error: student.errors.full_messages }, status: :unprocessable_entity
    end
  else
    render json: { error: "Student not found" }, status: :not_found
  end
end


def destroy
  student = Student.find_by(id: params[:id])

  if student
    student.destroy
    head :no_content
  else
    render json: { error: "Student not found" }, status: :not_found
  end
end

end
