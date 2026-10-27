(* GENERATED CODE - DO NOT EDIT *)
(* LayoutChild, a member of the cyclic module Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** The base class for objects that are meant to hold layout properties.

    If a [GtkLayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [GtkLayoutChild] implementation to store those
    properties.

    A [GtkLayoutChild] instance is only ever valid while a widget is part of a
    layout.

    The class built on this module is in {!Ocgtk.Layout_child}. *)

include module type of struct
  include
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .Layout_child
end
