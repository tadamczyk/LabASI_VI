# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :set_visit, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  # GET /visits
  def index
    @visits = Visit.all.order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
  end

  # GET /visits/1
  def show; end

  # GET /visits/new
  def new
    @visit = Visit.new
    @doctors = Doctor.all.order(:lastname, :firstname)
    @patients = Patient.all.order(:lastname, :firstname)
  end

  # GET /visits/1/edit
  def edit
    @doctors = Doctor.all.order(:lastname, :firstname)
    @patients = Patient.all.order(:lastname, :firstname)
  end

  # POST /visits
  def create
    @visit = Visit.new(visit_params)
    @doctors = Doctor.all.order(:lastname, :firstname)
    @patients = Patient.all.order(:lastname, :firstname)
    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /visits/1
  def update
    @doctors = Doctor.all.order(:lastname, :firstname)
    @patients = Patient.all.order(:lastname, :firstname)
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
    end
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:doctor_id, :patient_id, :date_of_visit, :description, :price)
  end

  def sort_column
    Visit.column_names.include?(params[:sort]) ? params[:sort] : 'date_of_visit'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
