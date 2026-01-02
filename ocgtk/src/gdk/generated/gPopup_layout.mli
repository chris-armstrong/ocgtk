class popup_layout : Popup_layout.t ->
  object
    method copy : unit -> Popup_layout.t
    method equal : Popup_layout.t -> bool
    method get_anchor_hints : unit -> Gdk_enums.anchorhints
    method get_anchor_rect : unit -> Rectangle.t
    method ref : unit -> Popup_layout.t
    method set_anchor_hints : Gdk_enums.anchorhints -> unit
    method set_anchor_rect : Rectangle.t -> unit
    method set_offset : int -> int -> unit
    method set_shadow_width : int -> int -> int -> int -> unit
    method unref : unit -> unit
    method as_popup_layout : Popup_layout.t
  end

