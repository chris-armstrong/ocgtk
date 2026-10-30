(* GENERATED CODE - DO NOT EDIT *)
(* Fontset, a member of the cyclic module Context_and__font_and__font_map_and__fontset *)

(** A [PangoFontset] represents a set of [PangoFont] to use when rendering text.

    A [PangoFontset] is the result of resolving a [PangoFontDescription] against
    a particular [PangoContext]. It has operations for finding the component
    font for a particular Unicode character, and for finding a composite set of
    metrics for the entire fontset.

    The class built on this module is in {!Ocpango.Fontset}. *)

include module type of struct
  include Context_and__font_and__font_map_and__fontset.Fontset
end
