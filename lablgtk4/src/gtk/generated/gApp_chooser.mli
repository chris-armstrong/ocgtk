class app_chooser : App_chooser.t ->
  object
    method get_content_type : unit -> string
    method refresh : unit -> unit
    method as_app_chooser : App_chooser.t
  end

