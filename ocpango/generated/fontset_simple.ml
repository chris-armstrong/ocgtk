class type fontset_simple_t = object
  inherit Fontset.fontset_t

  (** {2:methods Methods} *)

  method append : Font.font_t -> unit
  (** Adds a font to the fontset.

      The fontset takes ownership of [font]. *)

  method size : unit -> int
  (** Returns the number of fonts in the fontset. *)

  (** {2:conversions Conversions} *)

  method as_fontset_simple : Raw.Fontset_simple.t
end

(* High-level class for FontsetSimple *)
class fontset_simple (obj : Raw.Fontset_simple.t) : fontset_simple_t =
  object (self)
    inherit Fontset.fontset (obj :> Raw.Fontset.t)

    method append : Font.font_t -> unit =
      fun font ->
        let font = font#as_font in
        Raw.Fontset_simple.append obj font

    method size : unit -> int = fun () -> Raw.Fontset_simple.size obj
    method as_fontset_simple = obj
  end

let new_ (language : Raw.Language.t) : fontset_simple_t =
  let obj_ = Raw.Fontset_simple.new_ language in
  new fontset_simple obj_
