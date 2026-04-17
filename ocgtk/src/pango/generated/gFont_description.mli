class type font_description_t = object
    method better_match : Font_description.t option -> Font_description.t -> bool
    method copy : unit -> Font_description.t option
    method copy_static : unit -> Font_description.t option
    method equal : Font_description.t -> bool
    method free : unit -> unit
    method get_family : unit -> string option
    method get_gravity : unit -> Pango_enums.gravity
    method get_set_fields : unit -> Pango_enums.fontmask
    method get_size : unit -> int
    method get_size_is_absolute : unit -> bool
    method get_stretch : unit -> Pango_enums.stretch
    method get_style : unit -> Pango_enums.style
    method get_variant : unit -> Pango_enums.variant
    method get_variations : unit -> string option
    method get_weight : unit -> Pango_enums.weight
    method hash : unit -> int
    method merge : Font_description.t option -> bool -> unit
    method merge_static : Font_description.t -> bool -> unit
    method set_absolute_size : float -> unit
    method set_family : string -> unit
    method set_family_static : string -> unit
    method set_gravity : Pango_enums.gravity -> unit
    method set_size : int -> unit
    method set_stretch : Pango_enums.stretch -> unit
    method set_style : Pango_enums.style -> unit
    method set_variant : Pango_enums.variant -> unit
    method set_variations : string option -> unit
    method set_variations_static : string -> unit
    method set_weight : Pango_enums.weight -> unit
    method to_filename : unit -> string option
    method to_string : unit -> string
    method unset_fields : Pango_enums.fontmask -> unit
    method as_font_description : Font_description.t
end

class font_description : Font_description.t -> font_description_t

val new_ : unit -> font_description_t
