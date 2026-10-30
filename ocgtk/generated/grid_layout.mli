(** Arranges child widgets in rows and columns.

    Its methods, signals and properties are on {!class-type-grid_layout_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Grid_layout}. *)

(** {1:class Class} *)

class type grid_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:methods Methods} *)

  method get_baseline_row : unit -> int
  (** Retrieves the row set with [gtk_grid_layout_set_baseline_row ()]. *)

  method get_column_homogeneous : unit -> bool
  (** Checks whether all columns of [grid] should have the same width. *)

  method get_column_spacing : unit -> int
  (** Retrieves the spacing set with [gtk_grid_layout_set_column_spacing ()]. *)

  method get_row_baseline_position : int -> Enums.baselineposition
  (** Returns the baseline position of [row].

      If no value has been set with [Gtk.GridLayout.set_row_baseline_position],
      the default value of [GTK_BASELINE_POSITION_CENTER] is returned. *)

  method get_row_homogeneous : unit -> bool
  (** Checks whether all rows of [grid] should have the same height. *)

  method get_row_spacing : unit -> int
  (** Retrieves the spacing set with [gtk_grid_layout_set_row_spacing ()]. *)

  method set_baseline_row : int -> unit
  (** Sets which row defines the global baseline for the entire grid.

      Each row in the grid can have its own local baseline, but only one of
      those is global, meaning it will be the baseline in the parent of the
      [grid]. *)

  method set_column_homogeneous : bool -> unit
  (** Sets whether all columns of [grid] should have the same width. *)

  method set_column_spacing : int -> unit
  (** Sets the amount of space to insert between consecutive columns. *)

  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  (** Sets how the baseline should be positioned on [row] of the grid, in case
      that row is assigned more space than is requested. *)

  method set_row_homogeneous : bool -> unit
  (** Sets whether all rows of [grid] should have the same height. *)

  method set_row_spacing : int -> unit
  (** Sets the amount of space to insert between consecutive rows. *)

  (** {2:conversions Conversions} *)

  method as_grid_layout : Raw.Grid_layout.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [GridLayout].}\n\n\
     Inherits from: \
     {{!Ocgtk.Layout_manager.class-type-layout_manager_t}Ocgtk.Layout_manager}\n\n\
     Arranges child widgets in rows and columns.\n\n\
     Children have an \"attach point\" defined by the horizontal and vertical\n\
     index of the cell they occupy; children can span multiple rows or columns.\n\
     The layout properties for setting the attach points and spans are set\n\
     using the \
     {{!Ocgtk.Grid_layout_child.class-type-grid_layout_child_t}[Gtk.GridLayoutChild]} \
     associated to each child widget.\n\n\
     The behaviour of [GtkGridLayout] when several children occupy the same\n\
     grid cell is undefined.\n\n\
     [GtkGridLayout] can be used like a [GtkBoxLayout] if all children are\n\
     attached to the same row or column; however, if you only ever need a\n\
     single row or column, you should consider using [GtkBoxLayout]."]

class grid_layout : Raw.Grid_layout.t -> grid_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Grid_layout.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Arranges child widgets in rows and columns.\n\n\
 Children have an \"attach point\" defined by the horizontal and vertical\n\
 index of the cell they occupy; children can span multiple rows or columns.\n\
 The layout properties for setting the attach points and spans are set\n\
 using the \
 {{!Ocgtk.Grid_layout_child.class-type-grid_layout_child_t}[Gtk.GridLayoutChild]} \
 associated to each child widget.\n\n\
 The behaviour of [GtkGridLayout] when several children occupy the same\n\
 grid cell is undefined.\n\n\
 [GtkGridLayout] can be used like a [GtkBoxLayout] if all children are\n\
 attached to the same row or column; however, if you only ever need a\n\
 single row or column, you should consider using [GtkBoxLayout]."]

(** {1:constructors Constructors} *)

val new_ : unit -> grid_layout_t
(** Creates a new [GtkGridLayout]. *)
