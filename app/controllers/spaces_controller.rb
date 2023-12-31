# frozen_string_literal: true

# SpacesController
class SpacesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_space, only: [:show, :edit, :update, :destroy]
  #before_action :authorize_admin!, except: [:index, :show]

  
  

  # GET /spaces
  # GET /spaces.json
  def index
    
  

    @q = @spaces.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @spaces = @q.result
    @spaces = @spaces.order(:id).search(params[:pgq], params[:page])
    return unless params[:select2]

    select2_render
  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show; end

  # GET /spaces/new
  def new; end

  # GET /spaces/1/edit
  def edit; end

  # POST /spaces
  # POST /spaces.json
  def create
    # @space = Space.new(space_params)
      
    # if @space.save
    #    redirect_to @space, notice: 'Espaço criado com sucesso!'
    #  else
    #    render :new
    #  end


    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: "#{t('activerecord.models.space.one')} criado com sucesso" }
        format.json { render action: 'show', status: :created, location: @space }
      else
        format.html { render action: 'new' }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaces/1
  # PATCH/PUT /spaces/1.json
  def update
    #  if @space.update(space_params)
    #    redirect_to @space, notice: 'Espaço atualizado com sucesso!'
    #  else
    #    render :edit
    #  end


    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: "#{t('activerecord.models.space.one')} atualizado com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url }
      format.json { head :no_content }
    end
  end

  private

  # def set_space
  #   @space = Space.find(params[:id])
  # end

  # def authorize_admin!
  #   params.require(:space).permit(:name, :description)
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def space_params
    sanitize_active_storage_params(Space, @space)
    params.require(:space).permit(:name, :description)
  end

  def select2_render
    render json: Oj.dump(
      {
        results: @spaces.map { |space| { text: space.to_s, id: space.id } },
        pagination: { more: @spaces.next_page.present? }
      }, mode: :compat
    )
  end
end



# # app/controllers/espacos_controller.rb
# class EspacosController < ApplicationController
#   before_action :authenticate_user!, except: [:index, :show]
#   before_action :set_espaco, only: [:show, :edit, :update, :destroy]
#   before_action :authorize_admin!, except: [:index, :show]

#   def index
#     @espacos = Espaco.all
#   end

#   def show
#   end

#   def new
#     @espaco = Espaco.new
#   end

#   def create
#     @espaco = Espaco.new(espaco_params)

#     if @espaco.save
#       redirect_to @espaco, notice: 'Espaço criado com sucesso.'
#     else
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#     if @espaco.update(espaco_params)
#       redirect_to @espaco, notice: 'Espaço atualizado com sucesso.'
#     else
#       render :edit
#     end
#   end

#   def destroy
#     @espaco.destroy
#     redirect_to espacos_path, notice: 'Espaço deletado com sucesso.'
#   end

#   private

#   def set_espaco
#     @espaco = Espaco.find(params[:id])
#   end

#   def espaco_params
#     params.require(:espaco).permit(:nome, :descricao)
#   end

#   def authorize_admin!
#     unless current_user.admin?
#       redirect_to root_path, alert: 'Acesso não autorizado.'
#     end
#   end
# end

