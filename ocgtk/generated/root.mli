(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Root from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** An interface for widgets that can act as the root of a widget hierarchy.

    Its methods, signals and properties are on {!class-type-root_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Root}. *)

(** {1:class Class} *)

class type root_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .root_t
(** {b The methods, signals and properties of a [Root].}

    Requires:
    - {{!Ocgtk.Native.class-type-native_t}Ocgtk.Native}
    - {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    An interface for widgets that can act as the root of a widget hierarchy.

    The root widget takes care of providing the connection to the windowing
    system and manages layout, drawing and event delivery for its widget
    hierarchy.

    The obvious example of a [GtkRoot] is [GtkWindow].

    To get the display to which a [GtkRoot] belongs, use [Gtk.Root.get_display].

    [GtkRoot] also maintains the location of keyboard focus inside its widget
    hierarchy, with [Gtk.Root.set_focus] and [Gtk.Root.get_focus]. *)

class root : Raw.Root.t -> root_t
(** Wraps a raw handle of {!Ocgtk.Raw.Root.t}. *)

(** {1:description Description}

    An interface for widgets that can act as the root of a widget hierarchy.

    The root widget takes care of providing the connection to the windowing
    system and manages layout, drawing and event delivery for its widget
    hierarchy.

    The obvious example of a [GtkRoot] is [GtkWindow].

    To get the display to which a [GtkRoot] belongs, use [Gtk.Root.get_display].

    [GtkRoot] also maintains the location of keyboard focus inside its widget
    hierarchy, with [Gtk.Root.set_focus] and [Gtk.Root.get_focus]. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
