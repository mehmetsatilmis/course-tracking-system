class MessagesController < ApplicationController

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  def show
    # while(@message.save)
    #   render :partial => '_create.js.erb', locals: {message: @message}
    # end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.html { render :partial => 'create.js.erb', locals: { message: @message}}
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end

    PrivatePub.publish_to("/messages/bla", message: @message)

  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params[:message]
    params.require(:message).permit(:content ,:message_id, :lesson_id, :user_id, :dislike_count)
  end
end
