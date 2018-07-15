# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  # GET /patients
  def index
    @patients = Patient.search(params[:patient]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
  end

  # GET /patients/1
  def show; end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit; end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /patients/1
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:firstname, :lastname, :pesel, :date_of_birth)
  end

  def sort_column
    Patient.column_names.include?(params[:sort]) ? params[:sort] : 'lastname'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
