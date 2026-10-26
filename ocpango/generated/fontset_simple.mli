class type fontset_simple_t = object
  inherit Context_and__font_and__font_map_and__fontset.fontset_t
  method append : Context_and__font_and__font_map_and__fontset.font_t -> unit
  method size : unit -> int
  method as_fontset_simple : Raw.Fontset_simple.t
end

class fontset_simple : Raw.Fontset_simple.t -> fontset_simple_t

val new_ : Raw.Language.t -> fontset_simple_t
