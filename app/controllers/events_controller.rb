class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_organizer, only: %i[ organizer_events ]

  # GET /events or /events.json
  def index
    @events = Event.all
    @tickets = Ticket.group(:event_id)
    # sort by event date ascending
    if params[:sort_by] == "date"
     @events = @events.sort_by(&:event_date)
    # sort by event ticket minimum price ascending
    elsif params[:sort_by] == "price"
      @events = @events.sort_by { |e| e.tickets.minimum(:price) }
    else
      @events = Event.all  
    end
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
    @ticket = @event.tickets
    @order_ticket = current_order.order_tickets.new
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.tickets.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.poster = params[:event][:poster]
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def organizer_events
    @events = @organizer.events
    logger.debug "Organizer events: #{@events}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # get current organizer
    def set_organizer
      @organizer = current_organizer
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title,:poster, :description, :event_date, :end_date, :start_time, :end_time, :category, :subcategory, :location, :organizer_id, tickets_attributes: [:id, :title, :price, :_destroy])
    end
end
