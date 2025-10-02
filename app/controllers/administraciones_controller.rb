class AdministracionesController < ApplicationController
  before_action :set_administracion, only: %i[ show edit update destroy ]

  # GET /administraciones or /administraciones.json
  def index
    @administraciones = Administracion.all
  end

  # GET /administraciones/1 or /administraciones/1.json
  def show
  end

  # GET /administraciones/new
  def new
    @administracion = Administracion.new
  end

  # GET /administraciones/1/edit
  def edit
  end

  # POST /administraciones or /administraciones.json
  def create
    @administracion = Administracion.new(administracion_params)

    respond_to do |format|
      if @administracion.save
        format.html { redirect_to administracion_url(@administracion), notice: "Administracion was successfully created." }
        format.json { render :show, status: :created, location: @administracion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @administracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administraciones/1 or /administraciones/1.json
  def update
    respond_to do |format|
      if @administracion.update(administracion_params)
        format.html { redirect_to administracion_url(@administracion), notice: "Administracion was successfully updated." }
        format.json { render :show, status: :ok, location: @administracion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @administracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administraciones/1 or /administraciones/1.json
  def destroy
    @administracion.destroy

    respond_to do |format|
      format.html { redirect_to administraciones_url, notice: "Administracion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracion
      @administracion = Administracion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administracion_params
      params.require(:administracion).permit(:nombre)
    end
end
