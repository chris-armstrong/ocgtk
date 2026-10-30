(* GENERATED CODE - DO NOT EDIT *)
(* CustomLayout: CustomLayout *)

(** Uses closures for size negotiation.

    A [GtkCustomLayout] uses closures matching to the old [GtkWidget] virtual
    functions for size negotiation, as a convenience API to ease the porting
    towards the corresponding [GtkLayoutManager] virtual functions.

    The class built on this module is in {!Ocgtk.Custom_layout}. *)

type t = [ `custom_layout | `layout_manager | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_custom_layout_get_type"

(* Methods *)
