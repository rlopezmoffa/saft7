class BoletasController < ApplicationController
  before_action :set_boleta, only: %i[ show edit update destroy ]

  # GET /boletas or /boletas.json
  def index
    begin
      @fecha_inicial = Time.parse(session[:from]) # set dates from cookie
      @fecha_final = Time.parse(session[:to])
    rescue Exception => e
      @fecha_inicial = Time.now
      @fecha_final = Time.now
    end

        # @movimientos = Movimiento.all.page(params[:page]).per(20)
        # <% if @paginar %>
        #   <div align="center"><%= paginate @movimientos %></div>
        # <% end %>

    @boletas = Array.new
    @duplicados = Array.new

    if params[:from]
      @fecha_inicial = @from = Date.civil(params[:from][:year].to_i, params[:from][:month].to_i, params[:from][:day].to_i)
      @fecha_final = @to = Date.civil(params[:to][:year].to_i, params[:to][:month].to_i, params[:to][:day].to_i)
      session[:from]=@from.to_s # store dates in cookie
      session[:to]=@to.to_s      

      if params[:orden] == "Fecha"
        @boletas = periodo = Boleta.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc').page(params[:page]).per(20)
      elsif params[:orden] == "Id"
        @boletas = periodo = Boleta.where('fecha >= ? and fecha <= ?', @from, @to).order('id').page(params[:page]).per(20)
      else
        @boletas = periodo = Boleta.where('fecha >= ? and fecha <= ?', @from, @to).order('total_recaudado').page(params[:page]).per(20)
        @duplicados = verifica_duplicados(@boletas)             
      end
      @orden = params[:orden]
      
      @paginar = true
    end    

    # @boletas = Boleta.all.page(params[:page]).per(20)

    respond_to do |format|    
      format.xlsx {                         
        @boletas = Array.new                
        @from = session[:from]
        @to = session[:to]      

        if @from != nil                           
          @boletas = periodo = Boleta.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc')       
          @titulo = "Listdo de boletas desde: " + @from + " hasta: " + @to                 
        else
          @titulo = "listado de boletas"
        end
          
          response.headers[
            'Content-Disposition'
            ] =  sprintf("attachment; filename=%s.xlsx", @titulo)
          }          

      format.html {             
        render :index 
        puts('--------------------------------')
        puts(@duplicados.to_json)
      }
    end
  end

  # GET /boletas/1 or /boletas/1.json
  def show
    @notice = params[:notice]    
  end

  # GET /boletas/new
  def new
    @boleta = Boleta.new
  end

  # GET /boletas/1/edit
  def edit
  end

  # POST /boletas or /boletas.json
  def create
    notice = ""

    set_recaudacion

    @boleta = Boleta.new(boleta_params)
    @boleta.administracion_id = Session.new(nil).get_administracion_id
    vehiculo = Vehiculo.find(@boleta.vehiculo_id)
    @boleta.empresa_id = vehiculo.empresa_id

    respond_to do |format|      
      if @boleta.save
        format.html { redirect_to boleta_url(@boleta, notice: notice)}
        format.json { render :show, status: :created, location: @boleta }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @boleta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boletas/1 or /boletas/1.json
  def update
    respond_to do |format|

      set_recaudacion

      if @boleta.update(boleta_params)
        format.html { redirect_to boleta_url(@boleta) }
        format.json { render :show, status: :ok, location: @boleta }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @boleta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boletas/1 or /boletas/1.json
  def destroy
    @boleta.destroy

    respond_to do |format|
      format.html { redirect_to boletas_url, notice: "Boleta was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def verifica_duplicados(boletas)

      duplicados = Array.new
      index = 0    
      
      limite_sup = boletas.count - 1

      boletas.each do | boleta |
        if index < limite_sup
          if boletas[index].fecha == boletas[index + 1].fecha && boletas[index].empresa_id == boletas[index + 1].empresa_id &&
            boletas[index].chofer_id == boletas[index + 1].chofer_id && boletas[index].total_recaudado == boletas[index + 1].total_recaudado
            boletas[index].turno == boletas[index + 1].turno
           
            duplicados.push(boletas[index + 1].id)
          end          
          index += 1
        end        
      end

      return duplicados
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_boleta
      @boleta = Boleta.find(params[:id])
    end

    def set_recaudacion
      efectivo = params[:boleta][:rec_efectivo].to_f
      mercado_pago = params[:boleta][:rec_mercado_pago].to_f
      bits = params[:boleta][:rec_bits].to_f
      oca_cel = params[:boleta][:rec_oca_cel].to_f
      transferencia = params[:boleta][:rec_transferencia].to_f
      h13 = params[:boleta][:rec_h13].to_f
      otros = params[:boleta][:rec_otros].to_f
      salario = params[:boleta][:salario].to_f

      params[:boleta][:fecha] = params[:boleta][:fecha].present? ? params[:boleta][:fecha] : Date.today      

      recaudacion = efectivo + mercado_pago + oca_cel + bits + transferencia + h13 + otros
      params[:boleta][:recaudacion] = recaudacion
    end

    # Only allow a list of trusted parameters through.
    def boleta_params
      params.require(:boleta).permit(:fecha, :chofer_id, :vehiculo_id, :salario,
      :turno, :ticket, :comision, :combustible, :aceite, :gomeria, :lavados, :viaticos, :otros, :detalle_otros,
      :aportes, :kmts_ini, :kmts_fin, :rec_mercado_pago, :rec_bits, :rec_oca_cel, :rec_transferencia, :rec_h13, 
      :rec_pos, :rec_pago_corporativo, :rec_otros, :total_recaudado, :total_entregado,
      :combustible_credito, :aporte_manual, :aporte_calculado, :retenciones, :tipo_liquidacion, :forma_pago)
    end
end
