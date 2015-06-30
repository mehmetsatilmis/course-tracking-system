class CoursesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @pivot_tbl_entry = PivotTbl.create(course_id: @course.id, user_id: current_user.id)
    @course.pivot_tbls_id = @pivot_tbl_entry.id

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @course }
        @pivot_tbl_entry.update(course_id: @course.id)
        @pivot_list = current_user.pivot_tbls_id
        puts("[DBG]pivots: " )
        puts(@pivot_list)
        # current_user.update(pivot_tbls_id: [pivot_tbls_id , @pivot_tbl_entry.id])
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
        @pivot_tbl_entry.destroy
      end
    end


  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description)
    end
end
