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

class style_context : Raw.Style_context.t -> style_context_t
