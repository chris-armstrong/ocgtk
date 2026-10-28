(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutChild from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** The base class for objects that are meant to hold layout properties.

    Its methods, signals and properties are on {!class-type-layout_child_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Layout_child}. *)

(** {1:class Class} *)

class type layout_child_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .layout_child_t
(** {b The methods, signals and properties of a [LayoutChild].}

    Inherits from: [GObject.Object]

    The base class for objects that are meant to hold layout properties.

    If a [GtkLayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [GtkLayoutChild] implementation to store those
    properties.

    A [GtkLayoutChild] instance is only ever valid while a widget is part of a
    layout. *)

class layout_child : Raw.Layout_child.t -> layout_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Layout_child.t}. *)

(** {1:description Description}

    The base class for objects that are meant to hold layout properties.

    If a [GtkLayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [GtkLayoutChild] implementation to store those
    properties.

    A [GtkLayoutChild] instance is only ever valid while a widget is part of a
    layout. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
