class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_transaction_privelege


  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
    @budgets = Budget.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    #My changes
    #@transaction = Transaction.new(Date: Date.current)
    @transaction_type = params[:ttype]
    @transaction = Transaction.new(Date: Date.current)
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @t_type = params[:commit]
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        #My changes
        #@updateBudget = @transaction.Budget.update(Total_amount: @transaction.Budget.Total_amount.to_f - transaction_params[:Amount].to_f) 
        #format.html { redirect_to transactions_url, notice: "Transaction was successfully created" }
        if @t_type == 'deposit'
          @updateBudget = @transaction.Budget.update(Total_amount: @transaction.Budget.Total_amount.to_f + transaction_params[:Amount].to_f) 
        end
        if @t_type == 'withdraw'
          @updateBudget = @transaction.Budget.update(Total_amount: @transaction.Budget.Total_amount.to_f - transaction_params[:Amount].to_f) 
        end
        format.html { redirect_to transactions_url, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    puts "TESTING 2"
    beforeUpdate = @transaction.Amount
    respond_to do |format|
      if @transaction.update(transaction_params)
        #My changes
        #@updateBudget = @transaction.Budget.update(Total_amount: @transaction.Budget.Total_amount.to_f - transaction_params[:Amount].to_f + beforeUpdate.to_f ) 
        #format.html { redirect_to transactions_url, notice: "Transaction was successfully updated" }
        @updateBudget = @transaction.Budget.update(Total_amount: @transaction.Budget.Total_amount.to_f + transaction_params[:Amount].to_f + beforeUpdate.to_f ) 
        format.html { redirect_to transactions_url, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.Budget.update(Total_amount: @transaction.Budget.Total_amount.to_f + @transaction.Amount)
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed" }
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
      # params.require(:transaction).permit(:Purpose, :Amount, :Date, :Officer)
    end
end
