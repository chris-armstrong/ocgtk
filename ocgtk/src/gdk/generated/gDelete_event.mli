class delete_event : Delete_event.t ->
  object
    method as_delete_event : Delete_event.t
  end

