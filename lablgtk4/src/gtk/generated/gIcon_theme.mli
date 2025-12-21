class icon_theme : Icon_theme.t ->
  object
    inherit Gicon_theme_signals.icon_theme_signals
    method add_resource_path : string -> unit
    method get_theme_name : unit -> string
    method has_icon : string -> bool
    method set_theme_name : string option -> unit
    method as_icon_theme : Icon_theme.t
  end

