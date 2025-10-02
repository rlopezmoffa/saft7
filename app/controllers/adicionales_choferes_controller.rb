class AdicionalesChoferesController < ApplicationController
  before_action :set_adicional_chofer, only: %i[ show edit update destroy ]

  # GET /adicionales_choferes or /adicionales_choferes.json
  def index

    begin
      @fecha_inicial = Time.parse(session[:from]) # set dates from cookie
      @fecha_final = Time.parse(session[:to])
    rescue Exception => e
      @fecha_inicial = Time.now
      @fecha_final = Time.now
    end

    @adicionales_choferes = Array.new
    if params[:from]
      @fecha_inicial = @from = Date.civil(params[:from][:year].to_i, params[:from][:month].to_i, params[:from][:day].to_i)
      @fecha_final = @to = Date.civil(params[:to][:year].to_i, params[:to][:month].to_i, params[:to][:day].to_i)
      session[:from]=@from.to_s # store dates in cookie
      session[:to]=@to.to_s      
      chofer_id = params[:chofer][:id].to_i
      @adicionales_choferes = AdicionalChofer.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc').
        where('chofer_id = ?', chofer_id)
      @total_gastos = @total_ingresos = 0
      @adicionales_choferes.each do | x |
        @total_gastos += x.gastos
        @total_ingresos = x.ingresos
      end
    end    
  end

  # GET /adicionales_choferes/1 or /adicionales_choferes/1.json
  def show
  end

  # GET /adicionales_choferes/new
  def new
    @adicional_chofer = AdicionalChofer.new
  end

  # GET /adicionales_choferes/1/edit
  def edit
  end

  # POST /adicionales_choferes or /adicionales_choferes.json
  def create
    @adicional_chofer = AdicionalChofer.new(adicional_chofer_params)

    respond_to do |format|
      if @adicional_chofer.save
        format.html { redirect_to adicionales_choferes_path }
        format.json { render :show, status: :created, location: @adicional_chofer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adicional_chofer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adicionales_choferes/1 or /adicionales_choferes/1.json
  def update
    respond_to do |format|
      if @adicional_chofer.update(adicional_chofer_params)
        format.html { redirect_to adicionales_choferes_path }
        format.json { render :show, status: :ok, location: @adicional_chofer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adicional_chofer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adicionales_choferes/1 or /adicionales_choferes/1.json
  def destroy
    @adicional_chofer.destroy

    respond_to do |format|
      format.html { redirect_to adicionales_choferes_url, notice: "Adicional chofer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adicional_chofer
      @adicional_chofer = AdicionalChofer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adicional_chofer_params
      params.require(:adicional_chofer).permit(:fecha, :gastos, :ingresos, :chofer_id, :concepto)
    end
end
