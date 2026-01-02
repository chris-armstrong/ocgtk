(* GENERATED CODE - DO NOT EDIT *)
(* Popup: Popup *)

type t = [`popup] Gobject.obj

(* Methods *)
(** Present @popup after having processed the `GdkPopupLayout` rules.

If the popup was previously now showing, it will be showed,
otherwise it will change position according to @layout.

After calling this function, the result should be handled in response
to the [signal@Gdk.Surface::layout] signal being emitted. The resulting
popup position can be queried using [method@Gdk.Popup.get_position_x],
[method@Gdk.Popup.get_position_y], and the resulting size will be sent as
parameters in the layout signal. Use [method@Gdk.Popup.get_rect_anchor]
and [method@Gdk.Popup.get_surface_anchor] to get the resulting anchors.

Presenting may fail, for example if the @popup is set to autohide
and is immediately hidden upon being presented. If presenting failed,
the [signal@Gdk.Surface::layout] signal will not me emitted. *)
external present : t -> int -> int -> Popup_layout.t -> bool = "ml_gdk_popup_present"

(** Obtains the position of the popup relative to its parent. *)
external get_position_y : t -> int = "ml_gdk_popup_get_position_y"

(** Obtains the position of the popup relative to its parent. *)
external get_position_x : t -> int = "ml_gdk_popup_get_position_x"

(** Returns the parent surface of a popup. *)
external get_parent : t -> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Surface.t option = "ml_gdk_popup_get_parent"

(** Returns whether this popup is set to hide on outside clicks. *)
external get_autohide : t -> bool = "ml_gdk_popup_get_autohide"

(* Properties *)

