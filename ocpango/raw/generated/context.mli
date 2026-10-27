(* GENERATED CODE - DO NOT EDIT *)
(* Context, a member of the cyclic module Context_and__font_and__font_map_and__fontset *)

(** A [PangoContext] stores global information used to control the itemization
    process.

    The information stored by [PangoContext] includes the fontmap used to look
    up fonts, and default values such as the default language, default gravity,
    or default font.

    To obtain a [PangoContext], use [Pango.FontMap.create_context].

    The class built on this module is in {!Ocpango.Context}. *)

include module type of struct
  include Context_and__font_and__font_map_and__fontset.Context
end
