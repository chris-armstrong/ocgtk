(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerFocus: EventControllerFocus *)

(** Tracks keyboard focus.

    The event controller offers
    {{!Ocgtk.Raw.Event_controller_focus.val-on_enter}[Gtk.EventControllerFocus::enter]}
    and
    {{!Ocgtk.Raw.Event_controller_focus.val-on_leave}[Gtk.EventControllerFocus::leave]}
    signals, as well as
    {{!Ocgtk.Raw.Event_controller_focus.val-is_focus}[Gtk.EventControllerFocus:is-focus]}
    and
    {{!Ocgtk.Raw.Event_controller_focus.val-contains_focus}[Gtk.EventControllerFocus:contains-focus]}
    properties which are updated to reflect focus changes inside the widget
    hierarchy that is rooted at the controllers widget.

    The class built on this module is in {!Ocgtk.Event_controller_focus}. *)

type t = [ `event_controller_focus | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_event_controller_focus_get_type"

external new_ : unit -> t = "ml_gtk_event_controller_focus_new"
(** Creates a new event controller that will handle focus events. *)

(* Methods *)

external is_focus : t -> bool = "ml_gtk_event_controller_focus_is_focus"
(** Returns [true] if focus is within [self], but not one of its children. *)

external contains_focus : t -> bool
  = "ml_gtk_event_controller_focus_contains_focus"
(** Returns [true] if focus is within [self] or one of its children. *)

(* Properties *)

let on_enter ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"enter" ~callback
    ~after:(Option.value after ~default:false)

let on_leave ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"leave" ~callback
    ~after:(Option.value after ~default:false)
