class type popup_t = object
  method get_autohide : unit -> bool
  method get_parent : unit -> App_launch_context_cycle_de440b34.surface_t option
  method get_position_x : unit -> int
  method get_position_y : unit -> int
  method get_rect_anchor : unit -> Enums.gravity
  method get_surface_anchor : unit -> Enums.gravity
  method present : int -> int -> Raw.Popup_layout.t -> bool
  method as_popup : Raw.Popup.t
end

(* High-level class for Popup *)
class popup (obj : Raw.Popup.t) : popup_t =
  object (self)
    method get_autohide : unit -> bool = fun () -> Raw.Popup.get_autohide obj

    method get_parent :
        unit -> App_launch_context_cycle_de440b34.surface_t option =
      fun () ->
        Option.map
          (fun ret -> new App_launch_context_cycle_de440b34.surface ret)
          (Raw.Popup.get_parent obj)

    method get_position_x : unit -> int = fun () -> Raw.Popup.get_position_x obj
    method get_position_y : unit -> int = fun () -> Raw.Popup.get_position_y obj

    method get_rect_anchor : unit -> Enums.gravity =
      fun () -> Raw.Popup.get_rect_anchor obj

    method get_surface_anchor : unit -> Enums.gravity =
      fun () -> Raw.Popup.get_surface_anchor obj

    method present : int -> int -> Raw.Popup_layout.t -> bool =
      fun width height layout -> Raw.Popup.present obj width height layout

    method as_popup = obj
  end
