class LeadsController < ApplicationController
  before_action :set_lead, only: %i[ show edit update destroy ]

  # GET /leads or /leads.json
  def index
    begin
      @leads = Lead.all
    rescue => e
      respond_to do |format|
        format.html { redirect_to leads_url, notice: t('leads.index.error') }
        format.json { render json: { error: t('leads.index.error') }, status: :unprocessable_entity }
      end
      return
    end
  end

  # GET /leads/1 or /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to lead_url(@lead), notice: t('leads.create.success') }
        format.json { render :show, status: :ok, location: @lead }
      else
        @errors = @lead.errors.messages.transform_values(&:first)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to lead_url(@lead), notice: t('leads.update.success') }
        format.json { render :show, status: :ok, location: @lead }
      else
        @errors = @lead.errors.messages.transform_values(&:first)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    begin
      @lead.destroy!
    rescue ActiveRecord::RecordNotDestroyed => e
      respond_to do |format|
        format.html { redirect_to leads_url, notice: t('leads.destroy.error') }
        format.json { render json: { error: t('leads.destroy.error') }, status: :unprocessable_entity }
      end
      return
    end
  
    respond_to do |format|
      format.html { redirect_to leads_url, notice: t('leads.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      verify_lead_id unless @lead = Lead.find_by(id: params[:id])
    end

    def verify_lead_id
      respond_to do |format|
        format.html { redirect_to leads_url, alert: t('leads.errors.show.not_found') }
        format.json { render json: { error: t('leads.errors.show.not_found') }, status: :not_found }
      end
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:name, :email, :phone)
    end
end
