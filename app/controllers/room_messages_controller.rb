class RoomMessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  def index
    @message = RoomMessage.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @message = RoomMessage.new
  end

  # GET /tasks/1/edit
  def edit
    @message = RoomMessage.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @message = RoomMessage.create(message: params[:room_message][:message],
                               user_id: current_user.id,
                               room_id: params[:room_id])
    redirect_to :browse
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @message.update(give_params)
        format.html { redirect_to action: :index, notice: 'Message was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @message.destroy
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = RoomMessage.find(param[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:room_message).permit([:message])
    end
end
