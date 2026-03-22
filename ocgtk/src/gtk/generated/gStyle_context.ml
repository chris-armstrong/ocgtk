class type style_context_t = object
    method add_class : string -> unit
    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t
    method get_scale : unit -> int
    method get_state : unit -> Gtk_enums.stateflags
    method has_class : string -> bool
    method remove_class : string -> unit
    method restore : unit -> unit
    method save : unit -> unit
    method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit
    method set_scale : int -> unit
    method set_state : Gtk_enums.stateflags -> unit
    method to_string : Gtk_enums.stylecontextprintflags -> string
    method as_style_context : Style_context.t
end

(* High-level class for StyleContext *)
class style_context (obj : Style_context.t) : style_context_t = object (self)

  method add_class : string -> unit =
    fun class_name ->
      (Style_context.add_class obj class_name)

  method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Display.display(Style_context.get_display obj)

  method get_scale : unit -> int =
    fun () ->
      (Style_context.get_scale obj)

  method get_state : unit -> Gtk_enums.stateflags =
    fun () ->
      (Style_context.get_state obj)

  method has_class : string -> bool =
    fun class_name ->
      (Style_context.has_class obj class_name)

  method remove_class : string -> unit =
    fun class_name ->
      (Style_context.remove_class obj class_name)

  method restore : unit -> unit =
    fun () ->
      (Style_context.restore obj)

  method save : unit -> unit =
    fun () ->
      (Style_context.save obj)

  method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit =
    fun display ->
      let display = display#as_display in
      (Style_context.set_display obj display)

  method set_scale : int -> unit =
    fun scale ->
      (Style_context.set_scale obj scale)

  method set_state : Gtk_enums.stateflags -> unit =
    fun flags ->
      (Style_context.set_state obj flags)

  method to_string : Gtk_enums.stylecontextprintflags -> string =
    fun flags ->
      (Style_context.to_string obj flags)

    method as_style_context = obj
end

