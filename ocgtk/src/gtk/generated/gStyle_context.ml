(* High-level class for StyleContext *)
class style_context (obj : Style_context.t) = object (self)

  method add_class : string -> unit =
    fun class_name ->
      (Style_context.add_class obj class_name)

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

