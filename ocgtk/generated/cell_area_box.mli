(** A cell area that renders GtkCellRenderers into a row or a column

    Its methods, signals and properties are on {!class-type-cell_area_box_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_area_box}. *)

(** {1:class Class} *)

class type cell_area_box_t = object
  inherit Cell_area.cell_area_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_spacing : unit -> int
  (** Gets the spacing added between cell renderers. *)

  method set_spacing : int -> unit
  (** Sets the spacing to add between cell renderers in [box]. *)

  (** {2:conversions Conversions} *)

  method as_cell_area_box : Raw.Cell_area_box.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [CellAreaBox].}\n\n\
     Inherits from: {{!Ocgtk.Cell_area.class-type-cell_area_t}Ocgtk.Cell_area}\n\n\
     Implements:\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - {{!Ocgtk.Cell_layout.class-type-cell_layout_t}Ocgtk.Cell_layout}\n\
     - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}\n\n\
     A cell area that renders GtkCellRenderers into a row or a column\n\n\
     The [GtkCellAreaBox] renders cell renderers into a row or a column\n\
     depending on its [GtkOrientation].\n\n\
     GtkCellAreaBox uses a notion of packing. Packing\n\
     refers to adding cell renderers with reference to a particular position\n\
     in a [GtkCellAreaBox]. There are two reference positions: the\n\
     start and the end of the box.\n\
     When the [GtkCellAreaBox] is oriented in the [GTK_ORIENTATION_VERTICAL]\n\
     orientation, the start is defined as the top of the box and the end is\n\
     defined as the bottom. In the [GTK_ORIENTATION_HORIZONTAL] orientation\n\
     start is defined as the left side and the end is defined as the right\n\
     side.\n\n\
     Alignments of [GtkCellRenderer]s rendered in adjacent rows can be\n\
     configured by configuring the [GtkCellAreaBox] align child cell property\n\
     with gtk_cell_area_cell_set_property() or by specifying the \"align\"\n\
     argument to gtk_cell_area_box_pack_start() and \
     gtk_cell_area_box_pack_end()."]

class cell_area_box : Raw.Cell_area_box.t -> cell_area_box_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_area_box.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 A cell area that renders GtkCellRenderers into a row or a column\n\n\
 The [GtkCellAreaBox] renders cell renderers into a row or a column\n\
 depending on its [GtkOrientation].\n\n\
 GtkCellAreaBox uses a notion of packing. Packing\n\
 refers to adding cell renderers with reference to a particular position\n\
 in a [GtkCellAreaBox]. There are two reference positions: the\n\
 start and the end of the box.\n\
 When the [GtkCellAreaBox] is oriented in the [GTK_ORIENTATION_VERTICAL]\n\
 orientation, the start is defined as the top of the box and the end is\n\
 defined as the bottom. In the [GTK_ORIENTATION_HORIZONTAL] orientation\n\
 start is defined as the left side and the end is defined as the right\n\
 side.\n\n\
 Alignments of [GtkCellRenderer]s rendered in adjacent rows can be\n\
 configured by configuring the [GtkCellAreaBox] align child cell property\n\
 with gtk_cell_area_cell_set_property() or by specifying the \"align\"\n\
 argument to gtk_cell_area_box_pack_start() and gtk_cell_area_box_pack_end()."]

(** {1:constructors Constructors} *)

val new_ : unit -> cell_area_box_t
(** Creates a new [GtkCellAreaBox]. *)
