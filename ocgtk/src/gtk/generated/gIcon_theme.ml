(* Signal class defined in gicon_theme_signals.ml *)

(* High-level class for IconTheme *)
class icon_theme (obj : Icon_theme.t) = object (self)
  inherit Gicon_theme_signals.icon_theme_signals obj

  method add_resource_path : string -> unit =
    fun path ->
      (Icon_theme.add_resource_path obj path)

  method add_search_path : string -> unit =
    fun path ->
      (Icon_theme.add_search_path obj path)

  method get_icon_names : unit -> string array =
    fun () ->
      (Icon_theme.get_icon_names obj)

  method get_icon_sizes : string -> int array =
    fun icon_name ->
      (Icon_theme.get_icon_sizes obj icon_name)

  method get_resource_path : unit -> string array option =
    fun () ->
      (Icon_theme.get_resource_path obj)

  method get_theme_name : unit -> string =
    fun () ->
      (Icon_theme.get_theme_name obj)

  method has_icon : string -> bool =
    fun icon_name ->
      (Icon_theme.has_icon obj icon_name)

  method lookup_icon : string -> string array option -> int -> int -> Gtk_enums.textdirection -> Gtk_enums.iconlookupflags -> GIcon_paintable.icon_paintable =
    fun icon_name fallbacks size scale direction flags ->
      new  GIcon_paintable.icon_paintable(Icon_theme.lookup_icon obj icon_name fallbacks size scale direction flags)

  method set_resource_path : string array option -> unit =
    fun path ->
      (Icon_theme.set_resource_path obj path)

  method set_theme_name : string option -> unit =
    fun theme_name ->
      (Icon_theme.set_theme_name obj theme_name)

    method as_icon_theme = obj
end

