json.extract! ticket, :id, :title, :price, :event_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
