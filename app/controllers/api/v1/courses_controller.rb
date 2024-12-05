class Api::V1::CoursesController < ApplicationController

  before_action :set_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.where('end_date > ?', Time.now).includes(:videos)
    render json: @courses, include: :videos
  end

  def show
    render json: @course
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    head :no_content
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :end_date)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
