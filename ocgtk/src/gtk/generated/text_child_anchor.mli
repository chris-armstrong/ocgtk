(* GENERATED CODE - DO NOT EDIT *)
(* TextChildAnchor: TextChildAnchor *)

type t = [`text_child_anchor | `object_] Gobject.obj

(** Create a new TextChildAnchor *)
external new_ : unit -> t = "ml_gtk_text_child_anchor_new"

(** Create a new TextChildAnchor *)
external new_with_replacement : string -> t = "ml_gtk_text_child_anchor_new_with_replacement"

(* Methods *)
(** Determines whether a child anchor has been deleted from
the buffer.

Keep in mind that the child anchor will be unreferenced
when removed from the buffer, so you need to hold your own
reference (with g_object_ref()) if you plan to use this
function — otherwise all deleted child anchors will also
be finalized. *)
external get_deleted : t -> bool = "ml_gtk_text_child_anchor_get_deleted"

