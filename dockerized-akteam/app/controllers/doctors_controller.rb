# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  # GET /doctors
  def index
    @doctors = Doctor.search(params[:doctor]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
  end

  # GET /doctors/1
  def show; end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit; end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /doctors/1
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /doctors/1
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:firstname, :lastname, :pesel, :occupation)
  end

  def sort_column
    Doctor.column_names.include?(params[:sort]) ? params[:sort] : 'lastname'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
