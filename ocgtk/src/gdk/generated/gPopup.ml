class type popup_t = object
  method get_autohide : unit -> bool

  method get_parent :
    unit -> GApp_launch_context_cycle_de440b34.surface_t option

  method get_position_x : unit -> int
  method get_position_y : unit -> int
  method get_rect_anchor : unit -> Gdk_enums.gravity
  method get_surface_anchor : unit -> Gdk_enums.gravity
  method present : int -> int -> Popup_layout.t -> bool
  method as_popup : Popup.t
end

(* High-level class for Popup *)
class popup (obj : Popup.t) : popup_t =
  object (self)
    method get_autohide : unit -> bool = fun () -> Popup.get_autohide obj

    method get_parent :
        unit -> GApp_launch_context_cycle_de440b34.surface_t option =
      fun () ->
        Option.map
          (fun ret -> new GApp_launch_context_cycle_de440b34.surface ret)
          (Popup.get_parent obj)

    method get_position_x : unit -> int = fun () -> Popup.get_position_x obj
    method get_position_y : unit -> int = fun () -> Popup.get_position_y obj

    method get_rect_anchor : unit -> Gdk_enums.gravity =
      fun () -> Popup.get_rect_anchor obj

    method get_surface_anchor : unit -> Gdk_enums.gravity =
      fun () -> Popup.get_surface_anchor obj

    method present : int -> int -> Popup_layout.t -> bool =
      fun width height layout -> Popup.present obj width height layout

    method as_popup = obj
  end
