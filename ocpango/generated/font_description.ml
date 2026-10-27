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

(* High-level class for FontDescription *)
class font_description (obj : Raw.Font_description.t) : font_description_t =
  object (self)
    method better_match :
        Raw.Font_description.t option -> Raw.Font_description.t -> bool =
      fun old_match new_match ->
        Raw.Font_description.better_match obj old_match new_match

    method copy_static : unit -> Raw.Font_description.t option =
      fun () -> Raw.Font_description.copy_static obj

    method equal : Raw.Font_description.t -> bool =
      fun desc2 -> Raw.Font_description.equal obj desc2

    method get_color : unit -> Enums.fontcolor =
      fun () -> Raw.Font_description.get_color obj

    method get_family : unit -> string option =
      fun () -> Raw.Font_description.get_family obj

    method get_features : unit -> string option =
      fun () -> Raw.Font_description.get_features obj

    method get_gravity : unit -> Enums.gravity =
      fun () -> Raw.Font_description.get_gravity obj

    method get_set_fields : unit -> Enums.fontmask =
      fun () -> Raw.Font_description.get_set_fields obj

    method get_size : unit -> int = fun () -> Raw.Font_description.get_size obj

    method get_size_is_absolute : unit -> bool =
      fun () -> Raw.Font_description.get_size_is_absolute obj

    method get_stretch : unit -> Enums.stretch =
      fun () -> Raw.Font_description.get_stretch obj

    method get_style : unit -> Enums.style =
      fun () -> Raw.Font_description.get_style obj

    method get_variant : unit -> Enums.variant =
      fun () -> Raw.Font_description.get_variant obj

    method get_variations : unit -> string option =
      fun () -> Raw.Font_description.get_variations obj

    method get_weight : unit -> Enums.weight =
      fun () -> Raw.Font_description.get_weight obj

    method hash : unit -> int = fun () -> Raw.Font_description.hash obj

    method merge : Raw.Font_description.t option -> bool -> unit =
      fun desc_to_merge replace_existing ->
        Raw.Font_description.merge obj desc_to_merge replace_existing

    method merge_static : Raw.Font_description.t -> bool -> unit =
      fun desc_to_merge replace_existing ->
        Raw.Font_description.merge_static obj desc_to_merge replace_existing

    method set_absolute_size : float -> unit =
      fun size -> Raw.Font_description.set_absolute_size obj size

    method set_color : Enums.fontcolor -> unit =
      fun color -> Raw.Font_description.set_color obj color

    method set_family : string -> unit =
      fun family -> Raw.Font_description.set_family obj family

    method set_family_static : string -> unit =
      fun family -> Raw.Font_description.set_family_static obj family

    method set_features : string option -> unit =
      fun features -> Raw.Font_description.set_features obj features

    method set_features_static : string -> unit =
      fun features -> Raw.Font_description.set_features_static obj features

    method set_gravity : Enums.gravity -> unit =
      fun gravity -> Raw.Font_description.set_gravity obj gravity

    method set_size : int -> unit =
      fun size -> Raw.Font_description.set_size obj size

    method set_stretch : Enums.stretch -> unit =
      fun stretch -> Raw.Font_description.set_stretch obj stretch

    method set_style : Enums.style -> unit =
      fun style -> Raw.Font_description.set_style obj style

    method set_variant : Enums.variant -> unit =
      fun variant -> Raw.Font_description.set_variant obj variant

    method set_variations : string option -> unit =
      fun variations -> Raw.Font_description.set_variations obj variations

    method set_variations_static : string -> unit =
      fun variations ->
        Raw.Font_description.set_variations_static obj variations

    method set_weight : Enums.weight -> unit =
      fun weight -> Raw.Font_description.set_weight obj weight

    method to_filename : unit -> string option =
      fun () -> Raw.Font_description.to_filename obj

    method to_string : unit -> string =
      fun () -> Raw.Font_description.to_string obj

    method unset_fields : Enums.fontmask -> unit =
      fun to_unset -> Raw.Font_description.unset_fields obj to_unset

    method as_font_description = obj
  end

let new_ () : font_description_t =
  new font_description (Raw.Font_description.new_ ())
