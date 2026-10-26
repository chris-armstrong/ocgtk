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

(* High-level class for PopupLayout *)
class popup_layout (obj : Raw.Popup_layout.t) : popup_layout_t =
  object (self)
    method equal : Raw.Popup_layout.t -> bool =
      fun other -> Raw.Popup_layout.equal obj other

    method get_anchor_hints : unit -> Enums.anchorhints =
      fun () -> Raw.Popup_layout.get_anchor_hints obj

    method get_anchor_rect : unit -> Raw.Rectangle.t =
      fun () -> Raw.Popup_layout.get_anchor_rect obj

    method get_rect_anchor : unit -> Enums.gravity =
      fun () -> Raw.Popup_layout.get_rect_anchor obj

    method get_surface_anchor : unit -> Enums.gravity =
      fun () -> Raw.Popup_layout.get_surface_anchor obj

    method ref : unit -> Raw.Popup_layout.t = fun () -> Raw.Popup_layout.ref obj

    method set_anchor_hints : Enums.anchorhints -> unit =
      fun anchor_hints -> Raw.Popup_layout.set_anchor_hints obj anchor_hints

    method set_anchor_rect : Raw.Rectangle.t -> unit =
      fun anchor_rect -> Raw.Popup_layout.set_anchor_rect obj anchor_rect

    method set_offset : int -> int -> unit =
      fun dx dy -> Raw.Popup_layout.set_offset obj dx dy

    method set_rect_anchor : Enums.gravity -> unit =
      fun anchor -> Raw.Popup_layout.set_rect_anchor obj anchor

    method set_shadow_width : int -> int -> int -> int -> unit =
      fun left right top bottom ->
        Raw.Popup_layout.set_shadow_width obj left right top bottom

    method set_surface_anchor : Enums.gravity -> unit =
      fun anchor -> Raw.Popup_layout.set_surface_anchor obj anchor

    method as_popup_layout = obj
  end

let new_ (anchor_rect : Raw.Rectangle.t) (rect_anchor : Enums.gravity)
    (surface_anchor : Enums.gravity) : popup_layout_t =
  let obj_ = Raw.Popup_layout.new_ anchor_rect rect_anchor surface_anchor in
  new popup_layout obj_
