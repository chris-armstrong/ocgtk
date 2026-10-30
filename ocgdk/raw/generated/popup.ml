(* GENERATED CODE - DO NOT EDIT *)
(* Popup: Popup *)

(** A surface that is attached to another surface.

    The [GdkPopup] is positioned relative to its parent surface.

    [GdkPopup]s are typically used to implement menus and similar popups. They
    can be modal, which is indicated by the
    {{!Ocgdk.Raw.Popup.val-get_autohide}[Gdk.Popup:autohide]} property.

    The class built on this module is in {!Ocgdk.Popup}. *)

type t = [ `popup ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_popup_get_type"
external from_gobject : 'a Gobject.obj -> t = "ml_gdk_popup_from_gobject"

(* Methods *)

external present : t -> int -> int -> Popup_layout.t -> bool
  = "ml_gdk_popup_present"
(** Present [popup] after having processed the [GdkPopupLayout] rules.

    If the popup was previously not showing, it will be shown, otherwise it will
    change position according to [layout].

    After calling this function, the result should be handled in response to the
    {{!Ocgdk.Raw.Surface.val-on_layout}[Gdk.Surface::layout]} signal being
    emitted. The resulting popup position can be queried using
    {{!Ocgdk.Raw.Popup.val-get_position_x}[Gdk.Popup.get_position_x]},
    {{!Ocgdk.Raw.Popup.val-get_position_y}[Gdk.Popup.get_position_y]}, and the
    resulting size will be sent as parameters in the layout signal. Use
    {{!Ocgdk.Raw.Popup.val-get_rect_anchor}[Gdk.Popup.get_rect_anchor]} and
    {{!Ocgdk.Raw.Popup.val-get_surface_anchor}[Gdk.Popup.get_surface_anchor]} to
    get the resulting anchors.

    Presenting may fail, for example if the [popup] is set to autohide and is
    immediately hidden upon being presented. If presenting failed, the
    {{!Ocgdk.Raw.Surface.val-on_layout}[Gdk.Surface::layout]} signal will not me
    emitted. *)

external get_surface_anchor : t -> Ocgdk_enums.gravity
  = "ml_gdk_popup_get_surface_anchor"
(** Gets the current popup surface anchor.

    The value returned may change after calling
    {{!Ocgdk.Raw.Popup.val-present}[Gdk.Popup.present]}, or after the
    {{!Ocgdk.Raw.Surface.val-on_layout}[Gdk.Surface::layout]} signal is emitted.
*)

external get_rect_anchor : t -> Ocgdk_enums.gravity
  = "ml_gdk_popup_get_rect_anchor"
(** Gets the current popup rectangle anchor.

    The value returned may change after calling
    {{!Ocgdk.Raw.Popup.val-present}[Gdk.Popup.present]}, or after the
    {{!Ocgdk.Raw.Surface.val-on_layout}[Gdk.Surface::layout]} signal is emitted.
*)

external get_position_y : t -> int = "ml_gdk_popup_get_position_y"
(** Obtains the position of the popup relative to its parent. *)

external get_position_x : t -> int = "ml_gdk_popup_get_position_x"
(** Obtains the position of the popup relative to its parent. *)

external get_parent : t -> App_launch_context_cycle_de440b34.Surface.t option
  = "ml_gdk_popup_get_parent"
(** Returns the parent surface of a popup. *)

external get_autohide : t -> bool = "ml_gdk_popup_get_autohide"
(** Returns whether this popup is set to hide on outside clicks. *)

(* Properties *)
