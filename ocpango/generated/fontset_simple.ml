class type fontset_simple_t = object
  inherit Context_and__font_and__font_map_and__fontset.fontset_t

  method append : Context_and__font_and__font_map_and__fontset.font_t -> unit
  (** Adds a font to the fontset.

      The fontset takes ownership of [font]. *)

  method size : unit -> int
  (** Returns the number of fonts in the fontset. *)

  method as_fontset_simple : Raw.Fontset_simple.t
end

(* High-level class for FontsetSimple *)
class fontset_simple (obj : Raw.Fontset_simple.t) : fontset_simple_t =
  object (self)
    inherit
      Context_and__font_and__font_map_and__fontset.fontset
        (obj :> Raw.Fontset.t)

    method append : Context_and__font_and__font_map_and__fontset.font_t -> unit
        =
      fun font ->
        let font = font#as_font in
        Raw.Fontset_simple.append obj font

    method size : unit -> int = fun () -> Raw.Fontset_simple.size obj
    method as_fontset_simple = obj
  end

let new_ (language : Raw.Language.t) : fontset_simple_t =
  let obj_ = Raw.Fontset_simple.new_ language in
  new fontset_simple obj_
