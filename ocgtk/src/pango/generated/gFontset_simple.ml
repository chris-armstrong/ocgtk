(* High-level class for FontsetSimple *)
class fontset_simple (obj : Fontset_simple.t) = object (self)

  method append : 'p1. (#GContext_and__font_and__font_map_and__fontset.font as 'p1) -> unit =
    fun font ->
      let font = font#as_font in
      (Fontset_simple.append obj font)

  method size : unit -> int =
    fun () ->
      (Fontset_simple.size obj)

    method as_fontset_simple = obj
end

