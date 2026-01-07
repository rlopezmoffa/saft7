class AdicionalesVehiculosController < ApplicationController
  before_action :set_adicional_vehiculo, only: %i[ show edit update destroy ]

  # GET /adicionales_vehiculos or /adicionales_vehiculos.json
  def index
    begin
      @fecha_inicial = Time.parse(session[:from]) # set dates from cookie
      @fecha_final = Time.parse(session[:to])
    rescue Exception => e
      @fecha_inicial = Time.now
      @fecha_final = Time.now
    end

    @adicionales_vehiculos = Array.new
    if params[:from]
      @fecha_inicial = @from = Date.civil(params[:from][:year].to_i, params[:from][:month].to_i, params[:from][:day].to_i)
      @fecha_final = @to = Date.civil(params[:to][:year].to_i, params[:to][:month].to_i, params[:to][:day].to_i)
      session[:from]=@from.to_s # store dates in cookie
      session[:to]=@to.to_s      

      vehiculo_id = params[:vehiculo][:id].to_i

      @adicionales_vehiculos = AdicionalVehiculo.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc').
        where('vehiculo_id = ?', vehiculo_id)

      @total_gastos = @total_ingresos = 0
      @adicionales_vehiculos.each do | x |
        @total_gastos += x.gastos.to_f
        @total_ingresos = x.ingresos.to_f
      end        
    end    

    # @adicionales_vehiculos = AdicionalVehiculo.all
  end

  # GET /adicionales_vehiculos/1 or /adicionales_vehiculos/1.json
  def show
  end

  # GET /adicionales_vehiculos/new
  def new
    @adicional_vehiculo = AdicionalVehiculo.new
  end

  # GET /adicionales_vehiculos/1/edit
  def edit
  end

  # POST /adicionales_vehiculos or /adicionales_vehiculos.json
  def create
    @adicional_vehiculo = AdicionalVehiculo.new(adicional_vehiculo_params)

    respond_to do |format|
      if @adicional_vehiculo.save
        format.html { redirect_to adicionales_vehiculos_path }
        format.json { render :show, status: :created, location: @adicional_vehiculo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adicional_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adicionales_vehiculos/1 or /adicionales_vehiculos/1.json
  def update
    respond_to do |format|
      if @adicional_vehiculo.update(adicional_vehiculo_params)
        format.html { redirect_to adicionales_vehiculos_path }
        format.json { render :show, status: :ok, location: @adicional_vehiculo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adicional_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adicionales_vehiculos/1 or /adicionales_vehiculos/1.json
  def destroy
    @adicional_vehiculo.destroy

    respond_to do |format|
      format.html { redirect_to adicionales_vehiculos_url, notice: "Adicional vehiculo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adicional_vehiculo
      @adicional_vehiculo = AdicionalVehiculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adicional_vehiculo_params
      params.require(:adicional_vehiculo).permit(:fecha, :gastos, :ingresos, :vehiculo_id, :concepto)
    end
end
