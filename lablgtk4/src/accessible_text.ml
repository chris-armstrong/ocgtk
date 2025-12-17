(* GENERATED CODE - DO NOT EDIT *)
(* AccessibleText: AccessibleText *)

type t = [`accessible_text] Gobject.obj

(** Updates the boundary of the selection.

Implementations of the `GtkAccessibleText` interface should call this
function every time the selection has moved, in order to notify assistive
technologies. *)
external update_selection_bound : t -> unit = "ml_gtk_accessible_text_update_selection_bound"

(** Updates the position of the caret.

Implementations of the `GtkAccessibleText` interface should call this
function every time the caret has moved, in order to notify assistive
technologies. *)
external update_caret_position : t -> unit = "ml_gtk_accessible_text_update_caret_position"

