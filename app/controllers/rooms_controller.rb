class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]


  def index
    @room = Room.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @room = Room.new
  end

  # GET /tasks/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @give = Give.find(params[:give_id])
    @room = Room.new(name: @give.title)
    @history = RoomMessage.find_by(room_id:@room.id)
    @message = RoomMessage.new
    respond_to do |format|
      if @room.save
        format.html { render :show, notice: 'Room was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @room.update(give_params)
        format.html { redirect_to action: :index, notice: 'Room was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @room.destroy
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit([:name])
    end
end
