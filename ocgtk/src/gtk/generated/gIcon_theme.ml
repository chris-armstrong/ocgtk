(* Signal class defined in gicon_theme_signals.ml *)

class type icon_theme_t = object
  inherit Gicon_theme_signals.icon_theme_signals
  method add_resource_path : string -> unit
  method add_search_path : string -> unit
  method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t option
  method get_icon_names : unit -> string array
  method get_resource_path : unit -> string array option
  method get_search_path : unit -> string array option
  method get_theme_name : unit -> string
  method has_gicon : Ocgtk_gio.Gio.Icon.icon_t -> bool
  method has_icon : string -> bool

  method lookup_by_gicon :
    Ocgtk_gio.Gio.Icon.icon_t ->
    int ->
    int ->
    Gtk_enums.textdirection ->
    Gtk_enums.iconlookupflags ->
    GIcon_paintable.icon_paintable_t

  method lookup_icon :
    string ->
    string array option ->
    int ->
    int ->
    Gtk_enums.textdirection ->
    Gtk_enums.iconlookupflags ->
    GIcon_paintable.icon_paintable_t

  method set_resource_path : string array option -> unit
  method set_search_path : string array option -> unit
  method set_theme_name : string option -> unit
  method as_icon_theme : Icon_theme.t
end

(* High-level class for IconTheme *)
class icon_theme (obj : Icon_theme.t) : icon_theme_t =
  object (self)
    inherit Gicon_theme_signals.icon_theme_signals obj

    method add_resource_path : string -> unit =
      fun path -> Icon_theme.add_resource_path obj path

    method add_search_path : string -> unit =
      fun path -> Icon_theme.add_search_path obj path

    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gdk.Gdk.Display.display ret)
          (Icon_theme.get_display obj)

    method get_icon_names : unit -> string array =
      fun () -> Icon_theme.get_icon_names obj

    method get_resource_path : unit -> string array option =
      fun () -> Icon_theme.get_resource_path obj

    method get_search_path : unit -> string array option =
      fun () -> Icon_theme.get_search_path obj

    method get_theme_name : unit -> string =
      fun () -> Icon_theme.get_theme_name obj

    method has_gicon : Ocgtk_gio.Gio.Icon.icon_t -> bool =
      fun gicon ->
        let gicon = gicon#as_icon in
        Icon_theme.has_gicon obj gicon

    method has_icon : string -> bool =
      fun icon_name -> Icon_theme.has_icon obj icon_name

    method lookup_by_gicon :
        Ocgtk_gio.Gio.Icon.icon_t ->
        int ->
        int ->
        Gtk_enums.textdirection ->
        Gtk_enums.iconlookupflags ->
        GIcon_paintable.icon_paintable_t =
      fun icon size scale direction flags ->
        let icon = icon#as_icon in
        new GIcon_paintable.icon_paintable
          (Icon_theme.lookup_by_gicon obj icon size scale direction flags)

    method lookup_icon :
        string ->
        string array option ->
        int ->
        int ->
        Gtk_enums.textdirection ->
        Gtk_enums.iconlookupflags ->
        GIcon_paintable.icon_paintable_t =
      fun icon_name fallbacks size scale direction flags ->
        new GIcon_paintable.icon_paintable
          (Icon_theme.lookup_icon obj icon_name fallbacks size scale direction
             flags)

    method set_resource_path : string array option -> unit =
      fun path -> Icon_theme.set_resource_path obj path

    method set_search_path : string array option -> unit =
      fun path -> Icon_theme.set_search_path obj path

    method set_theme_name : string option -> unit =
      fun theme_name -> Icon_theme.set_theme_name obj theme_name

    method as_icon_theme = obj
  end

let new_ () : icon_theme_t = new icon_theme (Icon_theme.new_ ())
