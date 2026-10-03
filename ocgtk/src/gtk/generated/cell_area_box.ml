(* GENERATED CODE - DO NOT EDIT *)
(* CellAreaBox: CellAreaBox *)

type t =
  [ `cell_area_box | `cell_area | `initially_unowned | `object_ ] Gobject.obj
(** A cell area that renders GtkCellRenderers into a row or a column

    The [GtkCellAreaBox] renders cell renderers into a row or a column depending
    on its [GtkOrientation].

    GtkCellAreaBox uses a notion of packing. Packing refers to adding cell
    renderers with reference to a particular position in a [GtkCellAreaBox].
    There are two reference positions: the start and the end of the box. When
    the [GtkCellAreaBox] is oriented in the [GTK_ORIENTATION_VERTICAL]
    orientation, the start is defined as the top of the box and the end is
    defined as the bottom. In the [GTK_ORIENTATION_HORIZONTAL] orientation start
    is defined as the left side and the end is defined as the right side.

    Alignments of [GtkCellRenderer]s rendered in adjacent rows can be configured
    by configuring the [GtkCellAreaBox] align child cell property with
    gtk_cell_area_cell_set_property() or by specifying the “align” argument to
    gtk_cell_area_box_pack_start() and gtk_cell_area_box_pack_end(). *)

external new_ : unit -> t = "ml_gtk_cell_area_box_new"
(** Create a new CellAreaBox *)

(* Methods *)

external set_spacing : t -> int -> unit = "ml_gtk_cell_area_box_set_spacing"
(** Sets the spacing to add between cell renderers in [box]. *)

external pack_start : t -> Cell_renderer.t -> bool -> bool -> bool -> unit
  = "ml_gtk_cell_area_box_pack_start"
(** Adds [renderer] to [box], packed with reference to the start of [box].

    The [renderer] is packed after any other [GtkCellRenderer] packed with
    reference to the start of [box]. *)

external pack_end : t -> Cell_renderer.t -> bool -> bool -> bool -> unit
  = "ml_gtk_cell_area_box_pack_end"
(** Adds [renderer] to [box], packed with reference to the end of [box].

    The [renderer] is packed after (away from end of) any other
    [GtkCellRenderer] packed with reference to the end of [box]. *)

external get_spacing : t -> int = "ml_gtk_cell_area_box_get_spacing"
(** Gets the spacing added between cell renderers. *)

(* Properties *)
