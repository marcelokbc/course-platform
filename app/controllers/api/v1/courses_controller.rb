class Api::V1::CoursesController < ApplicationController

  before_action :set_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.includes(:videos).where('end_date >= ?', Date.today)
    courses_with_sizes = @courses.map do |course|
      {
        id: course.id,
        title: course.title,
        description: course.description,
        end_date: course.end_date,
        total_video_size: course.videos.sum(:size),
        videos: course.videos
      }
    end
    render json: courses_with_sizes
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
    params.require(:course).permit(
    :title, :description, :end_date, 
    videos_attributes: [:id, :title, :url, :size, :_destroy]
  )
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
