class Router
  def call(event)
    case event.event_type
    when Events::ProductCreated.name then Denormalizers::ProductCreated.new.call(event)
    when Events::ProductUpdated.name then Denormalizers::ProductUpdated.new.call(event)
    when Events::ProductDeleted.name then Denormalizers::ProductDeleted.new.call(event)
    end
  end
end