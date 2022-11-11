class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_transaction_privelege

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all.order(:Date).reverse_order
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    puts "TEST 1"
    @transaction_type = params[:ttype]
    @transaction = Transaction.new(Date: Date.current)
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    puts "TEST 2"
    puts transaction_params
    @t_type = params[:commit]
    create_params = transaction_params
    notice_msg = "Deposit was successfully created"

    if @t_type == 'Withdraw'
      create_params[:Amount] = -1 * create_params[:Amount].to_i
      puts params[:Amount]
      notice_msg = "Withdraw was successfully created"
    end
      
    @transaction = Transaction.new(create_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_url, notice: notice_msg }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    beforeUpdate = @transaction.Amount
    respond_to do |format|
      if @transaction.update(transaction_params)
        @updateBudget = @transaction.Budget.update(Total_amount: @transaction.Budget.Total_amount.to_f + transaction_params[:Amount].to_f - beforeUpdate.to_f ) 
        format.html { redirect_to transactions_url, notice: "Transaction was successfully updated" }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully deleted" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:Budget_id, :Purpose, :Amount, :Date, :Officer, :transaction_type)
    end
end
