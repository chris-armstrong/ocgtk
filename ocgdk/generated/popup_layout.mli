class type popup_layout_t = object
  method equal : Raw.Popup_layout.t -> bool
  method get_anchor_hints : unit -> Enums.anchorhints
  method get_anchor_rect : unit -> Raw.Rectangle.t
  method get_rect_anchor : unit -> Enums.gravity
  method get_surface_anchor : unit -> Enums.gravity
  method ref : unit -> Raw.Popup_layout.t
  method set_anchor_hints : Enums.anchorhints -> unit
  method set_anchor_rect : Raw.Rectangle.t -> unit
  method set_offset : int -> int -> unit
  method set_rect_anchor : Enums.gravity -> unit
  method set_shadow_width : int -> int -> int -> int -> unit
  method set_surface_anchor : Enums.gravity -> unit
  method as_popup_layout : Raw.Popup_layout.t
end

class popup_layout : Raw.Popup_layout.t -> popup_layout_t

val new_ : Raw.Rectangle.t -> Enums.gravity -> Enums.gravity -> popup_layout_t
