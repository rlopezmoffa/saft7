class EmpresasChoferesController < ApplicationController
  before_action :set_empresa_chofer, only: %i[ show edit update destroy ]

  # GET /empresas_choferes or /empresas_choferes.json
  def index
    # @chofer = Array.new
    @empresa = Empresa.find(params[:empresa_id])
    # @empresa_chofer = EmpresaChofer.all
    # puts(@empresa_chofer.to_json)
  
    # @choferes = Array.new

    # @empresa_chofer.each do | relacion |
    #   puts("relacion: " + relacion.to_json)
    #   chofer = Chofer.find(relacion.chofer_id)
    #   puts('chofer: ' + chofer.to_json)
    #   @choferes << chofer        
    # end

    # puts(@choferes.to_json)

    @choferes = Chofer.all

  end

  # GET /empresas_choferes/1 or /empresas_choferes/1.json
  def show
  end

  # GET /empresas_choferes/new
  def new
    @empresa_chofer = EmpresaChofer.new
    @empresa = Empresa.find(params[:empresa_id].to_i)
    @chofer = Chofer.find(params[:chofer_id].to_i)  
    @es_alta = true
  end

  # GET /empresas_choferes/1/edit
  def edit
    @empresa = Empresa.find(@empresa_chofer.empresa_id)
    @chofer = Chofer.find(@empresa_chofer.chofer_id)  
  end

  # POST /empresas_choferes or /empresas_choferes.json
  def create
    @empresa_chofer = EmpresaChofer.new(empresa_chofer_params)
    @empresa_chofer.administracion_id = Session.new(nil).get_administracion_id
    
    respond_to do |format|
      if existe_relacion(@empresa_chofer)
        format.html { redirect_to empresa_url(@empresa_chofer.empresa_id), notice: "El Chofer ya esta registrado en esa Empresa." }
      else
        if @empresa_chofer.save
          format.html { redirect_to empresa_url(@empresa_chofer.empresa_id), notice: "Se registro el chofer en la Empresa exitosamente." }
          format.json { render :show, status: :created, location: @empresa_chofer }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @empresa_chofer.errors, status: :unprocessable_entity }
        end
      end
    end
   
  end

  # PATCH/PUT /empresas_choferes/1 or /empresas_choferes/1.json
  def update
    respond_to do |format|
      if @empresa_chofer.update(empresa_chofer_params)     
        format.html { redirect_to empresa_path(@empresa_chofer.empresa_id) }
        format.json { render :show, status: :ok, location: @empresa_chofer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empresa_chofer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas_choferes/1 or /empresas_choferes/1.json
  def destroy
    @empresa_chofer.destroy

    respond_to do |format|
      format.html { redirect_to empresas_choferes_url, notice: "Empresa chofer was successfully destroyed." }
      format.json { head :no_content }
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa_chofer
      @empresa_chofer = EmpresaChofer.find(params[:id])
    end

    def existe_relacion(empresa_chofer)
      relacion = EmpresaChofer.where('empresa_id = ? AND chofer_id = ?', empresa_chofer.empresa_id, empresa_chofer.chofer_id)
      return relacion.present? ? true : false
    end

    # Only allow a list of trusted parameters through.
    def empresa_chofer_params
      params.require(:empresa_chofer).permit(:empresa_id, :chofer_id, :fecha_alta, :fecha_alta_bps,
      :porc_aporte, :porc_comision)
    end
end
