class type fontset_simple_t = object
    inherit GContext_and__font_and__font_map_and__fontset.fontset_t
    method append : GContext_and__font_and__font_map_and__fontset.font_t -> unit
    method size : unit -> int
    method as_fontset_simple : Fontset_simple.t
end

(* High-level class for FontsetSimple *)
class fontset_simple (obj : Fontset_simple.t) : fontset_simple_t = object (self)
  inherit GContext_and__font_and__font_map_and__fontset.fontset (Obj.magic obj : Context_and__font_and__font_map_and__fontset.Fontset.t)

  method append : GContext_and__font_and__font_map_and__fontset.font_t -> unit =
    fun font ->
      let font = font#as_font in
      (Fontset_simple.append obj font)

  method size : unit -> int =
    fun () ->
      (Fontset_simple.size obj)

    method as_fontset_simple = obj
end

