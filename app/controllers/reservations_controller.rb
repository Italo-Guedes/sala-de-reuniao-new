# frozen_string_literal: true

# ReservationsController
class ReservationsController < ApplicationController
  load_and_authorize_resource

  # GET /reservations
  # GET /reservations.json
  def index
    @q = @reservations.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @reservations = @q.result
    @reservations = @reservations.order(:id).search(params[:pgq], params[:page])
    return unless params[:select2]

    select2_render
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show; end

  # GET /reservations/new
  def new; end

  # GET /reservations/1/edit
  def edit; end

  # POST /reservations
  # POST /reservations.json
  def create
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "#{t('activerecord.models.reservation.one')} criado com sucesso" }
        format.json { render action: 'show', status: :created, location: @reservation }
      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "#{t('activerecord.models.reservation.one')} atualizado com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    sanitize_active_storage_params(Reservation, @reservation)
    params.require(:reservation).permit(:space_id, :date_start, :description)
  end

  def select2_render
    render json: Oj.dump(
      {
        results: @reservations.map { |reservation| { text: reservation.to_s, id: reservation.id } },
        pagination: { more: @reservations.next_page.present? }
      }, mode: :compat
    )
  end
end



# # app/controllers/reservas_controller.rb
# class ReservasController < ApplicationController
#   before_action :authenticate_user!
#   before_action :set_reserva, only: [:show, :edit, :update, :destroy]
#   before_action :authorize_admin!, only: [:destroy]

#   def index
#     @reservas = Reserva.order(data_hora_inicio: :desc)
#   end

#   def show
#   end

#   def new
#     @reserva = Reserva.new
#   end

#   def create
#     @reserva = Reserva.new(reserva_params)
#     @reserva.user = current_user

#     if @reserva.save
#       redirect_to @reserva, notice: 'Reserva criada com sucesso.'
#     else
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#     if @reserva.update(reserva_params)
#       redirect_to @reserva, notice: 'Reserva atualizada com sucesso.'
#     else
#       render :edit
#     end
#   end

#   def destroy
#     if @reserva.data_hora_inicio > Time.now || current_user.admin?
#       @reserva.destroy
#       redirect_to reservas_path, notice: 'Reserva deletada com sucesso.'
#     else
#       redirect_to reservas_path, alert: 'Você não tem permissão para deletar esta reserva após o seu horário de início.'
#     end
#   end

#   private

#   def set_reserva
#     @reserva = Reserva.find(params[:id])
#   end

#   def reserva_params
#     params.require(:reserva).permit(:espaco_id, :data_hora_inicio, :descricao)
#   end

#   def authorize_admin!
#     unless current_user.admin?
#       redirect_to root_path, alert: 'Acesso não autorizado.'
#     end
#   end
# end
