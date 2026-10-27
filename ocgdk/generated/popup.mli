(** A surface that is attached to another surface.

    The [GdkPopup] is positioned relative to its parent surface.

    [GdkPopup]s are typically used to implement menus and similar popups. They
    can be modal, which is indicated by the [Gdk.Popup:autohide] property.

    Its methods, signals and properties are on {!class-type-popup_t}. The
    functions it is built on are in {!Ocgdk.Raw.Popup}. *)

(** The methods, signals and properties of a [GdkPopup]. *)
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

class popup : Raw.Popup.t -> popup_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Popup.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkPopup], give one already wrapped. *)
