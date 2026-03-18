class app_chooser : App_chooser.t ->
  object
    method get_app_info : unit -> Ocgtk_gio.Gio.app_info option
    method get_content_type : unit -> string
    method refresh : unit -> unit
    method as_app_chooser : App_chooser.t
  end

