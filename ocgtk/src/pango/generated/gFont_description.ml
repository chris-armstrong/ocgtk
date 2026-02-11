(* High-level class for FontDescription *)
class font_description (obj : Font_description.t) = object (self)

  method better_match : Font_description.t option -> Font_description.t -> bool =
    fun old_match new_match ->
      (Font_description.better_match obj old_match new_match)

  method copy : unit -> Font_description.t option =
    fun () ->
      (Font_description.copy obj)

  method copy_static : unit -> Font_description.t option =
    fun () ->
      (Font_description.copy_static obj)

  method equal : Font_description.t -> bool =
    fun desc2 ->
      (Font_description.equal obj desc2)

  method free : unit -> unit =
    fun () ->
      (Font_description.free obj)

  method get_family : unit -> string option =
    fun () ->
      (Font_description.get_family obj)

  method get_gravity : unit -> Pango_enums.gravity =
    fun () ->
      (Font_description.get_gravity obj)

  method get_set_fields : unit -> Pango_enums.fontmask =
    fun () ->
      (Font_description.get_set_fields obj)

  method get_size : unit -> int =
    fun () ->
      (Font_description.get_size obj)

  method get_size_is_absolute : unit -> bool =
    fun () ->
      (Font_description.get_size_is_absolute obj)

  method get_stretch : unit -> Pango_enums.stretch =
    fun () ->
      (Font_description.get_stretch obj)

  method get_style : unit -> Pango_enums.style =
    fun () ->
      (Font_description.get_style obj)

  method get_variant : unit -> Pango_enums.variant =
    fun () ->
      (Font_description.get_variant obj)

  method get_variations : unit -> string option =
    fun () ->
      (Font_description.get_variations obj)

  method get_weight : unit -> Pango_enums.weight =
    fun () ->
      (Font_description.get_weight obj)

  method hash : unit -> int =
    fun () ->
      (Font_description.hash obj)

  method merge : Font_description.t option -> bool -> unit =
    fun desc_to_merge replace_existing ->
      (Font_description.merge obj desc_to_merge replace_existing)

  method merge_static : Font_description.t -> bool -> unit =
    fun desc_to_merge replace_existing ->
      (Font_description.merge_static obj desc_to_merge replace_existing)

  method set_absolute_size : float -> unit =
    fun size ->
      (Font_description.set_absolute_size obj size)

  method set_family : string -> unit =
    fun family ->
      (Font_description.set_family obj family)

  method set_family_static : string -> unit =
    fun family ->
      (Font_description.set_family_static obj family)

  method set_gravity : Pango_enums.gravity -> unit =
    fun gravity ->
      (Font_description.set_gravity obj gravity)

  method set_size : int -> unit =
    fun size ->
      (Font_description.set_size obj size)

  method set_stretch : Pango_enums.stretch -> unit =
    fun stretch ->
      (Font_description.set_stretch obj stretch)

  method set_style : Pango_enums.style -> unit =
    fun style ->
      (Font_description.set_style obj style)

  method set_variant : Pango_enums.variant -> unit =
    fun variant ->
      (Font_description.set_variant obj variant)

  method set_variations : string option -> unit =
    fun variations ->
      (Font_description.set_variations obj variations)

  method set_variations_static : string -> unit =
    fun variations ->
      (Font_description.set_variations_static obj variations)

  method set_weight : Pango_enums.weight -> unit =
    fun weight ->
      (Font_description.set_weight obj weight)

  method to_filename : unit -> string option =
    fun () ->
      (Font_description.to_filename obj)

  method to_string : unit -> string =
    fun () ->
      (Font_description.to_string obj)

  method unset_fields : Pango_enums.fontmask -> unit =
    fun to_unset ->
      (Font_description.unset_fields obj to_unset)

    method as_font_description = obj
end

