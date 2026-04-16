class type style_context_t = object
    method add_class : string -> unit
    method add_provider : GStyle_provider.style_provider_t -> int -> unit
    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t
    method get_scale : unit -> int
    method get_state : unit -> Gtk_enums.stateflags
    method has_class : string -> bool
    method remove_class : string -> unit
    method remove_provider : GStyle_provider.style_provider_t -> unit
    method restore : unit -> unit
    method save : unit -> unit
    method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit
    method set_scale : int -> unit
    method set_state : Gtk_enums.stateflags -> unit
    method to_string : Gtk_enums.stylecontextprintflags -> string
    method as_style_context : Style_context.t
end

class style_context : Style_context.t -> style_context_t

