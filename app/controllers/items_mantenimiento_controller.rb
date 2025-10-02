class ItemsMantenimientoController < ApplicationController
  before_action :set_item_mantenimiento, only: %i[ show edit update destroy ]

  # GET /items_mantenimiento or /items_mantenimiento.json
  def index
    @items_mantenimiento = ItemMantenimiento.all
  end

  # GET /items_mantenimiento/1 or /items_mantenimiento/1.json
  def show
    @servicios_realizados = ServicioRealizado.all
  end

  # GET /items_mantenimiento/new
  def new
    @item_mantenimiento = ItemMantenimiento.new
  end

  # GET /items_mantenimiento/1/edit
  def edit
  end

  # POST /items_mantenimiento or /items_mantenimiento.json
  def create
    @item_mantenimiento = ItemMantenimiento.new(item_mantenimiento_params)

    respond_to do |format|
      if @item_mantenimiento.save
        format.html { redirect_to item_mantenimiento_url(@item_mantenimiento), notice: "Item mantenimiento was successfully created." }
        format.json { render :show, status: :created, location: @item_mantenimiento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_mantenimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_mantenimiento/1 or /items_mantenimiento/1.json
  def update
    respond_to do |format|
      if @item_mantenimiento.update(item_mantenimiento_params)
        format.html { redirect_to item_mantenimiento_url(@item_mantenimiento), notice: "Item mantenimiento was successfully updated." }
        format.json { render :show, status: :ok, location: @item_mantenimiento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_mantenimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_mantenimiento/1 or /items_mantenimiento/1.json
  def destroy
    @item_mantenimiento.destroy

    respond_to do |format|
      format.html { redirect_to items_mantenimiento_url, notice: "Item mantenimiento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_mantenimiento
      @item_mantenimiento = ItemMantenimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_mantenimiento_params
      params.require(:item_mantenimiento).permit(:nombre, :cambiar_dias, :cambiar_kmts)
    end
end
