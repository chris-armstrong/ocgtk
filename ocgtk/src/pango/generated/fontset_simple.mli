(* GENERATED CODE - DO NOT EDIT *)
(* FontsetSimple: FontsetSimple *)

type t = [ `fontset_simple | `fontset | `object_ ] Gobject.obj
(** [PangoFontsetSimple] is a implementation of the abstract [PangoFontset] base
    class as an array of fonts.

    When creating a [PangoFontsetSimple], you have to provide the array of fonts
    that make up the fontset. *)

external new_ : Language.t -> t = "ml_pango_fontset_simple_new"
(** Create a new FontsetSimple *)

(* Methods *)

external size : t -> int = "ml_pango_fontset_simple_size"
(** Returns the number of fonts in the fontset. *)

external append :
  t -> Context_and__font_and__font_map_and__fontset.Font.t -> unit
  = "ml_pango_fontset_simple_append"
(** Adds a font to the fontset.

    The fontset takes ownership of [font]. *)
