class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:show, :edit, :update, :destroy]

  # GET /vacancies
  # GET /vacancies.json
  def index
    unless params[:applicant_id]
      @vacancies = Vacancy.all
      @vacancies_full = nil
    else
      @vacancies = Applicant.find(params[:applicant_id]).vacancies.order(:salary).reverse
      app_skills = Applicant.find(params[:applicant_id]).skills.map{ |s| s.id }
      @vacancies_full = @vacancies.select{ |vac| vac.skills.map{ |s| s.id } == app_skills }
    end
  end

  # GET /vacancies/1
  # GET /vacancies/1.json
  def show
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new
  end

  # GET /vacancies/1/edit
  def edit
  end

  # POST /vacancies
  # POST /vacancies.json
  def create
    @vacancy = Vacancy.new(vacancy_params)

    respond_to do |format|
      if @vacancy.save
        update_skills(@vacancy)
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vacancy }
      else
        format.html { render action: 'new' }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancies/1
  # PATCH/PUT /vacancies/1.json
  def update
    respond_to do |format|
      if @vacancy.update(vacancy_params)
        update_skills(@vacancy)
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1
  # DELETE /vacancies/1.json
  def destroy
    @vacancy.destroy
    respond_to do |format|
      format.html { redirect_to vacancies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacancy_params
      params.require(:vacancy).permit(:name, :upto, :salary, :contacts)
    end
end
