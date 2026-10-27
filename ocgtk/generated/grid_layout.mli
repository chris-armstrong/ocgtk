[@@@ocaml.text
"Arranges child widgets in rows and columns.\n\n\
 Children have an \"attach point\" defined by the horizontal and vertical\n\
 index of the cell they occupy; children can span multiple rows or columns.\n\
 The layout properties for setting the attach points and spans are set\n\
 using the [Gtk.GridLayoutChild] associated to each child widget.\n\n\
 The behaviour of [GtkGridLayout] when several children occupy the same\n\
 grid cell is undefined.\n\n\
 [GtkGridLayout] can be used like a [GtkBoxLayout] if all children are\n\
 attached to the same row or column; however, if you only ever need a\n\
 single row or column, you should consider using [GtkBoxLayout].\n\n\
 Its methods, signals and properties are on {!class-type-grid_layout_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Grid_layout}."]

(** The methods, signals and properties of a [GtkGridLayout]. *)
class type grid_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method get_baseline_row : unit -> int
  method get_column_homogeneous : unit -> bool
  method get_column_spacing : unit -> int
  method get_row_baseline_position : int -> Enums.baselineposition
  method get_row_homogeneous : unit -> bool
  method get_row_spacing : unit -> int
  method set_baseline_row : int -> unit
  method set_column_homogeneous : bool -> unit
  method set_column_spacing : int -> unit
  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  method set_row_homogeneous : bool -> unit
  method set_row_spacing : int -> unit
  method as_grid_layout : Raw.Grid_layout.t
end

class grid_layout : Raw.Grid_layout.t -> grid_layout_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Grid_layout.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGridLayout], give one already wrapped. *)

val new_ : unit -> grid_layout_t
