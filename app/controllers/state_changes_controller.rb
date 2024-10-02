class StateChangesController < ApplicationController
  before_action :set_state_change, only: %i[ show edit update destroy ]

  # GET /state_changes or /state_changes.json
  def index
    @state_changes = StateChange.all
  end

  # GET /state_changes/1 or /state_changes/1.json
  def show
  end

  # GET /state_changes/new
  def new
    @state_change = StateChange.new
  end

  # GET /state_changes/1/edit
  def edit
  end

  # POST /state_changes or /state_changes.json
  def create
    @state_change = StateChange.new(state_change_params)

    respond_to do |format|
      if @state_change.save
        format.html { redirect_to @state_change, notice: "State change was successfully created." }
        format.json { render :show, status: :created, location: @state_change }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @state_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_changes/1 or /state_changes/1.json
  def update
    respond_to do |format|
      if @state_change.update(state_change_params)
        format.html { redirect_to @state_change, notice: "State change was successfully updated." }
        format.json { render :show, status: :ok, location: @state_change }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @state_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_changes/1 or /state_changes/1.json
  def destroy
    @state_change.destroy!

    respond_to do |format|
      format.html { redirect_to state_changes_path, status: :see_other, notice: "State change was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_change
      @state_change = StateChange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_change_params
      params.require(:state_change).permit(:project_id, :from_state, :to_state, :user_id)
    end
end
