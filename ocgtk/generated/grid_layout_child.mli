(** [GtkLayoutChild] subclass for children in a [GtkGridLayout].

    Its methods, signals and properties are on
    {!class-type-grid_layout_child_t}. The functions it is built on are in
    {!Ocgtk.Raw.Grid_layout_child}. *)

(** The methods, signals and properties of a [GtkGridLayoutChild]. *)
class type grid_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method get_column : unit -> int
  method get_column_span : unit -> int
  method get_row : unit -> int
  method get_row_span : unit -> int
  method set_column : int -> unit
  method set_column_span : int -> unit
  method set_row : int -> unit
  method set_row_span : int -> unit
  method as_grid_layout_child : Raw.Grid_layout_child.t
end

class grid_layout_child : Raw.Grid_layout_child.t -> grid_layout_child_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Grid_layout_child.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkGridLayoutChild], give one already wrapped. *)
