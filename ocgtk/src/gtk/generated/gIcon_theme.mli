class icon_theme : Icon_theme.t ->
  object
    inherit Gicon_theme_signals.icon_theme_signals
    method add_resource_path : string -> unit
    method add_search_path : string -> unit
    method get_icon_names : unit -> string array
    method get_icon_sizes : string -> int array
    method get_resource_path : unit -> string array option
    method get_theme_name : unit -> string
    method has_icon : string -> bool
    method lookup_icon : string -> string array option -> int -> int -> Gtk_enums.textdirection -> Gtk_enums.iconlookupflags -> GIcon_paintable.icon_paintable
    method set_resource_path : string array option -> unit
    method set_theme_name : string option -> unit
    method as_icon_theme : Icon_theme.t
  end

