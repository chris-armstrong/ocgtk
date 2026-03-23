class type popup_layout_t = object
    method copy : unit -> Popup_layout.t
    method equal : Popup_layout.t -> bool
    method get_anchor_hints : unit -> Gdk_enums.anchorhints
    method get_anchor_rect : unit -> Rectangle.t
    method get_rect_anchor : unit -> Gdk_enums.gravity
    method get_surface_anchor : unit -> Gdk_enums.gravity
    method ref : unit -> Popup_layout.t
    method set_anchor_hints : Gdk_enums.anchorhints -> unit
    method set_anchor_rect : Rectangle.t -> unit
    method set_offset : int -> int -> unit
    method set_rect_anchor : Gdk_enums.gravity -> unit
    method set_shadow_width : int -> int -> int -> int -> unit
    method set_surface_anchor : Gdk_enums.gravity -> unit
    method unref : unit -> unit
    method as_popup_layout : Popup_layout.t
end

class popup_layout : Popup_layout.t -> popup_layout_t

val new_ : Rectangle.t -> Gdk_enums.gravity -> Gdk_enums.gravity -> popup_layout_t
