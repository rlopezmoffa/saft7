class ServiciosRealizadosController < ApplicationController
  before_action :set_servicio_realizado, only: %i[ show edit update destroy ]

  # GET /servicios_realizados or /servicios_realizados.json
  def index
    @vehiculo = Vehiculo.find(params[:id])
    @servicios_realizados = ServicioRealizado.where('vehiculo_id = ?', @vehiculo.id)
  end

  # GET /servicios_realizados/1 or /servicios_realizados/1.json
  def show
  end

  # GET /servicios_realizados/new
  def new
    @vehiculo = Vehiculo.find(params[:id])
    @servicio_realizado = ServicioRealizado.new
    @servicio_realizado.vehiculo_id = @vehiculo.id
  end

  # GET /servicios_realizados/1/edit
  def edit
  end

  # POST /servicios_realizados or /servicios_realizados.json
  def create
    @servicio_realizado = ServicioRealizado.new(servicio_realizado_params)

    respond_to do |format|
      if @servicio_realizado.save
        format.html { redirect_to servicios_realizados_path(:id => @servicio_realizado.vehiculo_id) }
        format.json { render :show, status: :created, location: @servicio_realizado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @servicio_realizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicios_realizados/1 or /servicios_realizados/1.json
  def update
    respond_to do |format|
      if @servicio_realizado.update(servicio_realizado_params)
        format.html { redirect_to servicios_realizados_path }
        format.json { render :show, status: :ok, location: @servicio_realizado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @servicio_realizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicios_realizados/1 or /servicios_realizados/1.json
  def destroy
    @servicio_realizado.destroy

    respond_to do |format|
      format.html { redirect_to servicios_realizados_url, notice: "Servicio realizado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servicio_realizado
      @servicio_realizado = ServicioRealizado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def servicio_realizado_params
      params.require(:servicio_realizado).permit(:item, :fecha, :kmts, :fecha_proximo, 
      :kmts_proximo, :observaciones, :vehiculo_id, :item_id)
    end
end
