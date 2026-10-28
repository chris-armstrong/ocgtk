(** [GtkLayoutChild] subclass for children in a [GtkGridLayout].

    Its methods, signals and properties are on
    {!class-type-grid_layout_child_t}. The functions it is built on are in
    {!Ocgtk.Raw.Grid_layout_child}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GridLayoutChild].}

    [GtkLayoutChild] subclass for children in a [GtkGridLayout]. *)
class type grid_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method get_column : unit -> int
  (** Retrieves the column number to which [child] attaches its left side. *)

  method get_column_span : unit -> int
  (** Retrieves the number of columns that [child] spans to. *)

  method get_row : unit -> int
  (** Retrieves the row number to which [child] attaches its top side. *)

  method get_row_span : unit -> int
  (** Retrieves the number of rows that [child] spans to. *)

  method set_column : int -> unit
  (** Sets the column number to attach the left side of [child]. *)

  method set_column_span : int -> unit
  (** Sets the number of columns [child] spans to. *)

  method set_row : int -> unit
  (** Sets the row to place [child] in. *)

  method set_row_span : int -> unit
  (** Sets the number of rows [child] spans to. *)

  method as_grid_layout_child : Raw.Grid_layout_child.t
end

class grid_layout_child : Raw.Grid_layout_child.t -> grid_layout_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Grid_layout_child.t}. *)
