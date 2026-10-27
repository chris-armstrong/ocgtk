(** A [PangoFontDescription] describes a font in an implementation-independent
    manner.

    [PangoFontDescription] structures are used both to list what fonts are
    available on the system and also for specifying the characteristics of a
    font to load.

    Its methods, signals and properties are on {!class-type-font_description_t}.
    The functions it is built on are in {!Ocpango.Raw.Font_description}. *)

(** The methods, signals and properties of a [PangoFontDescription]. *)
class type font_description_t = object
  method better_match :
    Raw.Font_description.t option -> Raw.Font_description.t -> bool

  method copy_static : unit -> Raw.Font_description.t option
  method equal : Raw.Font_description.t -> bool
  method get_color : unit -> Enums.fontcolor
  method get_family : unit -> string option
  method get_features : unit -> string option
  method get_gravity : unit -> Enums.gravity
  method get_set_fields : unit -> Enums.fontmask
  method get_size : unit -> int
  method get_size_is_absolute : unit -> bool
  method get_stretch : unit -> Enums.stretch
  method get_style : unit -> Enums.style
  method get_variant : unit -> Enums.variant
  method get_variations : unit -> string option
  method get_weight : unit -> Enums.weight
  method hash : unit -> int
  method merge : Raw.Font_description.t option -> bool -> unit
  method merge_static : Raw.Font_description.t -> bool -> unit
  method set_absolute_size : float -> unit
  method set_color : Enums.fontcolor -> unit
  method set_family : string -> unit
  method set_family_static : string -> unit
  method set_features : string option -> unit
  method set_features_static : string -> unit
  method set_gravity : Enums.gravity -> unit
  method set_size : int -> unit
  method set_stretch : Enums.stretch -> unit
  method set_style : Enums.style -> unit
  method set_variant : Enums.variant -> unit
  method set_variations : string option -> unit
  method set_variations_static : string -> unit
  method set_weight : Enums.weight -> unit
  method to_filename : unit -> string option
  method to_string : unit -> string
  method unset_fields : Enums.fontmask -> unit
  method as_font_description : Raw.Font_description.t
end

class font_description : Raw.Font_description.t -> font_description_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Font_description.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoFontDescription], give one already wrapped. *)

val new_ : unit -> font_description_t
