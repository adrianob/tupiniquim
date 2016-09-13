class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :update_state]

  # GET /orders
  # GET /orders.json
  def index
    authorize Order
    @orders = Order.in_state(current_user.viewable_state).order('created_at asc')
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    authorize @order
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.order_details.build
    authorize @order
  end

  # GET /orders/1/edit
  def edit
    authorize @order
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    authorize @order

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    authorize @order
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    authorize @order
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_state
    @order.transition_to @order.state_machine.allowed_transitions.first
    @order.update_attribute(:waiter, current_user) if current_user.is_a? Waiter
    redirect_to orders_url, notice: 'Pedido atualizado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:client_id, :state,  order_details_attributes: [:id, :menu_item_id, :dessert_id, :drink_id, :_destroy])
    end
end
