class LeadsController < ApplicationController
  before_action :set_lead, only: %i[show edit update destroy]

  # GET /leads or /leads.json
  def index
    @leads = Lead.all
    @stl= t('stl')
    @etl= t('etl')
    @new_lead= t('new_lead')
    @destroy_lead= t('destroy_lead')
    @back_to_leads= t('back_to_leads')
  end

  # GET /leads/1 or /leads/1.json
  def show
    @stl= t('stl')
    @etl= t('etl')
    @destroy_lead= t('destroy_lead')
    @back_to_leads= t('back_to_leads')
  end

  # GET /leads/new
  def new
    @back_to_leads= t('back_to_leads')
    @name= t('name')
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
    @stl= t('stl')
    @etl= t('etl')
    @update= t('update')
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      redirect_to leads_path, notice: 'Lead criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    if @lead.update(lead_params)
      redirect_to lead_url(@lead), notice: "Lead foi atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @destroy_lead= t('destroy_lead')
    @lead.destroy
    redirect_to leads_url, notice: "Lead foi excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:name, :email, :phone)
    end
end
