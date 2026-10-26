class type style_context_t = object
  method add_class : string -> unit
  method add_provider : Style_provider.style_provider_t -> int -> unit
  method get_display : unit -> Ocgdk.Display.display_t
  method get_scale : unit -> int
  method get_state : unit -> Enums.stateflags
  method has_class : string -> bool
  method remove_class : string -> unit
  method remove_provider : Style_provider.style_provider_t -> unit
  method restore : unit -> unit
  method save : unit -> unit
  method set_display : Ocgdk.Display.display_t -> unit
  method set_scale : int -> unit
  method set_state : Enums.stateflags -> unit
  method to_string : Enums.stylecontextprintflags -> string
  method as_style_context : Raw.Style_context.t
end

(* High-level class for StyleContext *)
class style_context (obj : Raw.Style_context.t) : style_context_t =
  object (self)
    method add_class : string -> unit =
      fun class_name -> Raw.Style_context.add_class obj class_name

    method add_provider : Style_provider.style_provider_t -> int -> unit =
      fun provider priority ->
        let provider = provider#as_style_provider in
        Raw.Style_context.add_provider obj provider priority

    method get_display : unit -> Ocgdk.Display.display_t =
      fun () -> new Ocgdk.Display.display (Raw.Style_context.get_display obj)

    method get_scale : unit -> int = fun () -> Raw.Style_context.get_scale obj

    method get_state : unit -> Enums.stateflags =
      fun () -> Raw.Style_context.get_state obj

    method has_class : string -> bool =
      fun class_name -> Raw.Style_context.has_class obj class_name

    method remove_class : string -> unit =
      fun class_name -> Raw.Style_context.remove_class obj class_name

    method remove_provider : Style_provider.style_provider_t -> unit =
      fun provider ->
        let provider = provider#as_style_provider in
        Raw.Style_context.remove_provider obj provider

    method restore : unit -> unit = fun () -> Raw.Style_context.restore obj
    method save : unit -> unit = fun () -> Raw.Style_context.save obj

    method set_display : Ocgdk.Display.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Style_context.set_display obj display

    method set_scale : int -> unit =
      fun scale -> Raw.Style_context.set_scale obj scale

    method set_state : Enums.stateflags -> unit =
      fun flags -> Raw.Style_context.set_state obj flags

    method to_string : Enums.stylecontextprintflags -> string =
      fun flags -> Raw.Style_context.to_string obj flags

    method as_style_context = obj
  end
