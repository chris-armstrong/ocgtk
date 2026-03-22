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

(* High-level class for PopupLayout *)
class popup_layout (obj : Popup_layout.t) : popup_layout_t = object (self)

  method copy : unit -> Popup_layout.t =
    fun () ->
      (Popup_layout.copy obj)

  method equal : Popup_layout.t -> bool =
    fun other ->
      (Popup_layout.equal obj other)

  method get_anchor_hints : unit -> Gdk_enums.anchorhints =
    fun () ->
      (Popup_layout.get_anchor_hints obj)

  method get_anchor_rect : unit -> Rectangle.t =
    fun () ->
      (Popup_layout.get_anchor_rect obj)

  method get_rect_anchor : unit -> Gdk_enums.gravity =
    fun () ->
      (Popup_layout.get_rect_anchor obj)

  method get_surface_anchor : unit -> Gdk_enums.gravity =
    fun () ->
      (Popup_layout.get_surface_anchor obj)

  method ref : unit -> Popup_layout.t =
    fun () ->
      (Popup_layout.ref obj)

  method set_anchor_hints : Gdk_enums.anchorhints -> unit =
    fun anchor_hints ->
      (Popup_layout.set_anchor_hints obj anchor_hints)

  method set_anchor_rect : Rectangle.t -> unit =
    fun anchor_rect ->
      (Popup_layout.set_anchor_rect obj anchor_rect)

  method set_offset : int -> int -> unit =
    fun dx dy ->
      (Popup_layout.set_offset obj dx dy)

  method set_rect_anchor : Gdk_enums.gravity -> unit =
    fun anchor ->
      (Popup_layout.set_rect_anchor obj anchor)

  method set_shadow_width : int -> int -> int -> int -> unit =
    fun left right top bottom ->
      (Popup_layout.set_shadow_width obj left right top bottom)

  method set_surface_anchor : Gdk_enums.gravity -> unit =
    fun anchor ->
      (Popup_layout.set_surface_anchor obj anchor)

  method unref : unit -> unit =
    fun () ->
      (Popup_layout.unref obj)

    method as_popup_layout = obj
end

let new_ (anchor_rect : Rectangle.t) (rect_anchor : Gdk_enums.gravity) (surface_anchor : Gdk_enums.gravity) : popup_layout_t =
  new popup_layout (Popup_layout.new_ anchor_rect rect_anchor surface_anchor)

