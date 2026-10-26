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

(* High-level class for IconTheme *)
class icon_theme (obj : Raw.Icon_theme.t) : icon_theme_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Icon_theme.on_changed ~after self#as_icon_theme ~callback

    method add_resource_path : string -> unit =
      fun path -> Raw.Icon_theme.add_resource_path obj path

    method add_search_path : string -> unit =
      fun path -> Raw.Icon_theme.add_search_path obj path

    method get_display : unit -> Ocgdk.Display.display_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Display.display ret)
          (Raw.Icon_theme.get_display obj)

    method get_icon_names : unit -> string array =
      fun () -> Raw.Icon_theme.get_icon_names obj

    method get_resource_path : unit -> string array option =
      fun () -> Raw.Icon_theme.get_resource_path obj

    method get_search_path : unit -> string array option =
      fun () -> Raw.Icon_theme.get_search_path obj

    method get_theme_name : unit -> string =
      fun () -> Raw.Icon_theme.get_theme_name obj

    method has_gicon : Ocgio.Icon.icon_t -> bool =
      fun gicon ->
        let gicon = gicon#as_icon in
        Raw.Icon_theme.has_gicon obj gicon

    method has_icon : string -> bool =
      fun icon_name -> Raw.Icon_theme.has_icon obj icon_name

    method lookup_by_gicon :
        Ocgio.Icon.icon_t ->
        int ->
        int ->
        Enums.textdirection ->
        Enums.iconlookupflags ->
        Icon_paintable.icon_paintable_t =
      fun icon size scale direction flags ->
        let icon = icon#as_icon in
        new Icon_paintable.icon_paintable
          (Raw.Icon_theme.lookup_by_gicon obj icon size scale direction flags)

    method lookup_icon :
        string ->
        string array option ->
        int ->
        int ->
        Enums.textdirection ->
        Enums.iconlookupflags ->
        Icon_paintable.icon_paintable_t =
      fun icon_name fallbacks size scale direction flags ->
        new Icon_paintable.icon_paintable
          (Raw.Icon_theme.lookup_icon obj icon_name fallbacks size scale
             direction flags)

    method set_resource_path : string array option -> unit =
      fun path -> Raw.Icon_theme.set_resource_path obj path

    method set_search_path : string array option -> unit =
      fun path -> Raw.Icon_theme.set_search_path obj path

    method set_theme_name : string option -> unit =
      fun theme_name -> Raw.Icon_theme.set_theme_name obj theme_name

    method as_icon_theme = obj
  end

let new_ () : icon_theme_t = new icon_theme (Raw.Icon_theme.new_ ())
