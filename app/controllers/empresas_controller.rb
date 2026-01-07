class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[ show edit update destroy ]

  # GET /empresas or /empresas.json
  def index
    @empresas = Empresa.order('nombre')

      respond_to do |format|    
        format.xlsx {            
          response.headers[
            'Content-Disposition'
            ] = "attachment; filename=Empresas.xlsx"}

        format.html {             
          render :index 
      }
      
    end
  end

  # GET /empresas/1 or /empresas/1.json
  def show
    @choferes = Array.new
    @relaciones = EmpresaChofer.where('empresas_choferes.empresa_id = ?',@empresa.id)
    @relaciones.each do | relacion |
      chofer = Chofer.where('id = ?',relacion.chofer_id).first
      if chofer.present?
        @choferes << chofer  
      end
    end
    @vehiculos = Vehiculo.where('empresa_id = ?', @empresa.id)
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)
    @empresa.administracion_id = Session.new(nil).get_administracion_id

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to empresas_path }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1 or /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to empresas_path }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1 or /empresas/1.json
  def destroy
    @empresa.destroy

    respond_to do |format|
      format.html { redirect_to empresas_url, notice: "Empresa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:nombre, :direccion, :nro_bps, :rut, :flag_activa, :telefonos,
      :whatsapp, :observaciones, :fecha_ingreso, :email)
    end
end
