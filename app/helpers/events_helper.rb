module EventsHelper
  
  def event_link(event)
    big_panel_link(event, "events")
  end
  
  def event_details_panel(event)
    big_panel_details_panel(event, "events")
  end
end
