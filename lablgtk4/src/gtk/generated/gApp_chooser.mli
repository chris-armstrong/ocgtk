class app_chooser : App_chooser.t ->
  object
    method refresh : unit -> unit
    method as_app_chooser : App_chooser.t
  end

