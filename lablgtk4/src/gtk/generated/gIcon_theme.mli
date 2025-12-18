class icon_theme : Icon_theme.t ->
  object
    inherit Gicon_theme_signals.icon_theme_signals
    method theme_name : string
    method set_theme_name : string -> unit
    method add_resource_path : string -> unit
    method add_search_path : string -> unit
    method get_icon_names : unit -> unit
    method get_icon_sizes : string -> unit
    method get_resource_path : unit -> unit
    method get_search_path : unit -> unit
    method has_icon : string -> bool
    method as_icon_theme : Icon_theme.t
  end

