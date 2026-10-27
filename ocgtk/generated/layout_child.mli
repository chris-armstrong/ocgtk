(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutChild from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** The base class for objects that are meant to hold layout properties.

    If a [GtkLayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [GtkLayoutChild] implementation to store those
    properties.

    A [GtkLayoutChild] instance is only ever valid while a widget is part of a
    layout.

    Its methods, signals and properties are on {!class-type-layout_child_t}. The
    functions it is built on are in {!Ocgtk.Raw.Layout_child}. *)

class type layout_child_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .layout_child_t
(** The methods, signals and properties of a [GtkLayoutChild]. *)

class layout_child : Raw.Layout_child.t -> layout_child_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Layout_child.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkLayoutChild], give one already wrapped. *)
