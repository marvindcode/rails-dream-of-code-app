class TrimestersController < ApplicationController
  before_action :set_trimester, only: [:edit, :update]
  before_action :require_login
  before_action :require_admin, only: %i[new create edit update destroy]

  def edit
  end

  def update
    date_str = params.dig(:trimester, :application_deadline)
    return head :bad_request if date_str.blank?

    begin
      parsed_date = Date.parse(date_str)
    rescue ArgumentError
      return head :bad_request
    end

    if @trimester.update(application_deadline: parsed_date)
      respond_to do |format|
        format.html { redirect_to edit_trimester_path(@trimester), notice: "Application deadline updated." }
        format.json { render json: { id: @trimester.id, application_deadline: @trimester.application_deadline }, status: :ok }
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = @trimester.errors.full_messages.to_sentence
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @trimester.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_trimester
    @trimester = Trimester.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
