class PivotTblsController < ApplicationController
  before_action :set_pivot_tbl, only: [:show, :edit, :update, :destroy]

  # GET /pivot_tbls
  # GET /pivot_tbls.json
  def index
    @pivot_tbls = PivotTbl.all
  end

  # GET /pivot_tbls/1
  # GET /pivot_tbls/1.json
  def show
  end

  # GET /pivot_tbls/new
  def new
    @pivot_tbl = PivotTbl.new
  end

  # GET /pivot_tbls/1/edit
  def edit
  end

  # POST /pivot_tbls
  # POST /pivot_tbls.json
  def create
    @pivot_tbl = PivotTbl.new(pivot_tbl_params)

    respond_to do |format|
      if @pivot_tbl.save
        format.html { redirect_to @pivot_tbl, notice: 'Pivot tbl was successfully created.' }
        format.json { render :show, status: :created, location: @pivot_tbl }
      else
        format.html { render :new }
        format.json { render json: @pivot_tbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pivot_tbls/1
  # PATCH/PUT /pivot_tbls/1.json
  def update
    respond_to do |format|
      if @pivot_tbl.update(pivot_tbl_params)
        format.html { redirect_to @pivot_tbl, notice: 'Pivot tbl was successfully updated.' }
        format.json { render :show, status: :ok, location: @pivot_tbl }
      else
        format.html { render :edit }
        format.json { render json: @pivot_tbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pivot_tbls/1
  # DELETE /pivot_tbls/1.json
  def destroy
    @pivot_tbl.destroy
    respond_to do |format|
      format.html { redirect_to pivot_tbls_url, notice: 'Pivot tbl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pivot_tbl
      @pivot_tbl = PivotTbl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pivot_tbl_params
      params[:pivot_tbl]
    end
end
