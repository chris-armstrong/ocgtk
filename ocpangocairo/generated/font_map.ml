class type font_map_t = object
  method get_font_type : unit -> Occairo.Enums.fonttype
  method get_resolution : unit -> float
  method set_default : unit -> unit
  method set_resolution : float -> unit
  method as_font_map : Raw.Font_map.t
end

(* High-level class for FontMap *)
class font_map (obj : Raw.Font_map.t) : font_map_t =
  object (self)
    method get_font_type : unit -> Occairo.Enums.fonttype =
      fun () -> Raw.Font_map.get_font_type obj

    method get_resolution : unit -> float =
      fun () -> Raw.Font_map.get_resolution obj

    method set_default : unit -> unit = fun () -> Raw.Font_map.set_default obj

    method set_resolution : float -> unit =
      fun dpi -> Raw.Font_map.set_resolution obj dpi

    method as_font_map = obj
  end
