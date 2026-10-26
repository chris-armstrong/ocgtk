class type icon_theme_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method add_resource_path : string -> unit
  method add_search_path : string -> unit
  method get_display : unit -> Ocgdk.Display.display_t option
  method get_icon_names : unit -> string array
  method get_resource_path : unit -> string array option
  method get_search_path : unit -> string array option
  method get_theme_name : unit -> string
  method has_gicon : Ocgio.Icon.icon_t -> bool
  method has_icon : string -> bool

  method lookup_by_gicon :
    Ocgio.Icon.icon_t ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t

  method lookup_icon :
    string ->
    string array option ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t

  method set_resource_path : string array option -> unit
  method set_search_path : string array option -> unit
  method set_theme_name : string option -> unit
  method as_icon_theme : Raw.Icon_theme.t
end

class icon_theme : Raw.Icon_theme.t -> icon_theme_t

val new_ : unit -> icon_theme_t
