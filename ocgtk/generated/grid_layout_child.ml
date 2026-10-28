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

(* High-level class for GridLayoutChild *)
class grid_layout_child (obj : Raw.Grid_layout_child.t) : grid_layout_child_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .layout_child
        (obj :> Raw.Layout_child.t)

    method get_column : unit -> int =
      fun () -> Raw.Grid_layout_child.get_column obj

    method get_column_span : unit -> int =
      fun () -> Raw.Grid_layout_child.get_column_span obj

    method get_row : unit -> int = fun () -> Raw.Grid_layout_child.get_row obj

    method get_row_span : unit -> int =
      fun () -> Raw.Grid_layout_child.get_row_span obj

    method set_column : int -> unit =
      fun column -> Raw.Grid_layout_child.set_column obj column

    method set_column_span : int -> unit =
      fun span -> Raw.Grid_layout_child.set_column_span obj span

    method set_row : int -> unit =
      fun row -> Raw.Grid_layout_child.set_row obj row

    method set_row_span : int -> unit =
      fun span -> Raw.Grid_layout_child.set_row_span obj span

    method as_grid_layout_child = obj
  end
