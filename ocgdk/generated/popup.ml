class type popup_t = object
  method get_autohide : unit -> bool
  (** Returns whether this popup is set to hide on outside clicks. *)

  method get_parent : unit -> App_launch_context_cycle_de440b34.surface_t option
  (** Returns the parent surface of a popup. *)

  method get_position_x : unit -> int
  (** Obtains the position of the popup relative to its parent. *)

  method get_position_y : unit -> int
  (** Obtains the position of the popup relative to its parent. *)

  method get_rect_anchor : unit -> Enums.gravity
  (** Gets the current popup rectangle anchor.

      The value returned may change after calling [Gdk.Popup.present], or after
      the [Gdk.Surface::layout] signal is emitted. *)

  method get_surface_anchor : unit -> Enums.gravity
  (** Gets the current popup surface anchor.

      The value returned may change after calling [Gdk.Popup.present], or after
      the [Gdk.Surface::layout] signal is emitted. *)

  method present : int -> int -> Raw.Popup_layout.t -> bool
  (** Present [popup] after having processed the [GdkPopupLayout] rules.

      If the popup was previously not showing, it will be shown, otherwise it
      will change position according to [layout].

      After calling this function, the result should be handled in response to
      the [Gdk.Surface::layout] signal being emitted. The resulting popup
      position can be queried using [Gdk.Popup.get_position_x],
      [Gdk.Popup.get_position_y], and the resulting size will be sent as
      parameters in the layout signal. Use [Gdk.Popup.get_rect_anchor] and
      [Gdk.Popup.get_surface_anchor] to get the resulting anchors.

      Presenting may fail, for example if the [popup] is set to autohide and is
      immediately hidden upon being presented. If presenting failed, the
      [Gdk.Surface::layout] signal will not me emitted. *)

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
