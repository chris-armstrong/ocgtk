(* High-level class for PopupLayout *)
class popup_layout (obj : Popup_layout.t) = object (self)

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

  method set_shadow_width : int -> int -> int -> int -> unit =
    fun left right top bottom ->
      (Popup_layout.set_shadow_width obj left right top bottom)

  method unref : unit -> unit =
    fun () ->
      (Popup_layout.unref obj)

    method as_popup_layout = obj
end

