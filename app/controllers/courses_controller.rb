class CoursesController < ApplicationController
  # Authenticate/authorize BEFORE hitting the DB
  before_action :require_login
  before_action :require_admin, only: %i[new create edit update destroy]
  before_action :set_course,    only: %i[show edit update destroy]

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
    # @course is set in set_course
  end

  # GET /courses/new
  def new
    @course = Course.new
    load_form_collections
  end

  # GET /courses/1/edit
  def edit
    load_form_collections
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: "Course was successfully created."
    else
      load_form_collections
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: "Course was successfully updated."
    else
      load_form_collections
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy!
    redirect_to courses_path, status: :see_other, notice: "Course was successfully destroyed."
  end

  private

  def load_form_collections
    @coding_classes = CodingClass.order(:title)
    @trimesters     = Trimester.order(year: :desc, term: :asc)
  end

  def set_course
    # Preload associations to avoid N+1 when showing
    @course = Course.includes(:coding_class, :students).find(params[:id])
  end

  def course_params
    params.require(:course).permit(:coding_class_id, :trimester_id, :max_enrollment)
  end
end

