class type icon_theme_t = object
    inherit Gicon_theme_signals.icon_theme_signals
    method add_resource_path : string -> unit
    method add_search_path : string -> unit
    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t option
    method get_icon_names : unit -> string array
    method get_resource_path : unit -> string array option
    method get_theme_name : unit -> string
    method has_gicon : Ocgtk_gio.Gio.Icon.icon_t -> bool
    method has_icon : string -> bool
    method lookup_by_gicon : Ocgtk_gio.Gio.Icon.icon_t -> int -> int -> Gtk_enums.textdirection -> Gtk_enums.iconlookupflags -> GIcon_paintable.icon_paintable_t
    method lookup_icon : string -> string array option -> int -> int -> Gtk_enums.textdirection -> Gtk_enums.iconlookupflags -> GIcon_paintable.icon_paintable_t
    method set_resource_path : string array option -> unit
    method set_theme_name : string option -> unit
    method as_icon_theme : Icon_theme.t
end

class icon_theme : Icon_theme.t -> icon_theme_t

val new_ : unit -> icon_theme_t
