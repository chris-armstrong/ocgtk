(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for EventController from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** The base class for event controllers.

    Its methods, signals and properties are on {!class-type-event_controller_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Event_controller}. *)

(** {1:class Class} *)

class type event_controller_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .event_controller_t
(** {b The methods, signals and properties of a [EventController].}

    Inherits from: [GObject.Object]

    The base class for event controllers.

    These are ancillary objects associated to widgets, which react to
    [GdkEvents], and possibly trigger actions as a consequence.

    Event controllers are added to a widget with [Gtk.Widget.add_controller]. It
    is rarely necessary to explicitly remove a controller with
    [Gtk.Widget.remove_controller].

    See the chapter on input handling for an overview of the basic concepts,
    such as the capture and bubble phases of event propagation. *)

class event_controller : Raw.Event_controller.t -> event_controller_t
(** Wraps a raw handle of {!Ocgtk.Raw.Event_controller.t}. *)

(** {1:description Description}

    The base class for event controllers.

    These are ancillary objects associated to widgets, which react to
    [GdkEvents], and possibly trigger actions as a consequence.

    Event controllers are added to a widget with [Gtk.Widget.add_controller]. It
    is rarely necessary to explicitly remove a controller with
    [Gtk.Widget.remove_controller].

    See the chapter on input handling for an overview of the basic concepts,
    such as the capture and bubble phases of event propagation. *)
