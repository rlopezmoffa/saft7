class ChoferesController < ApplicationController
  before_action :set_chofer, only: %i[ show edit update destroy ]

  # GET /choferes or /choferes.json
  def index
    @choferes = Chofer.order('apellido asc')
  end

  # GET /choferes/1 or /choferes/1.json
  def show
  end

  # GET /choferes/new
  def new
    @chofer = Chofer.new
  end

  # GET /choferes/1/edit
  def edit
  end

  # POST /choferes or /choferes.json
  def create
    @chofer = Chofer.new(chofer_params)
    @chofer.administracion_id = Session.new(nil).get_administracion_id

    respond_to do |format|
      if @chofer.save
        format.html { redirect_to choferes_path }
        format.json { render :show, status: :created, location: @chofer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chofer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /choferes/1 or /choferes/1.json
  def update
    respond_to do |format|
      if @chofer.update(chofer_params)
        format.html { redirect_to choferes_path }
        format.json { render :show, status: :ok, location: @chofer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chofer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choferes/1 or /choferes/1.json
  def destroy
    @chofer.destroy

    respond_to do |format|
      format.html { redirect_to choferes_url, notice: "Chofer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chofer
      @chofer = Chofer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chofer_params
      params.require(:chofer).permit(:codigo, :nombre, :apellido, :cedula, :vencimiento_cedula, :libreta_chofer, 
      :vencimiento_libreta_chofer, :carne_salud, :vencimiento_carne_salud, :fecha_nacimiento,:domicilio, :telefonos,
      :whatsapp, :email, :mutualista, :emergencia, :contacto_tercero, :banco, :sucursal_banco, :cuenta_banco, :observaciones)
    end
end
