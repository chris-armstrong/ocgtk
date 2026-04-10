(* GENERATED CODE - DO NOT EDIT *)
(* AccessibleList: AccessibleList *)

(** A boxed type which wraps a list of references to GtkAccessible objects. *)
type t = [`accessible_list] Gobject.obj

(** Create a new AccessibleList *)
external new_from_array : At_context_and__accessible.Accessible.t array -> int -> t = "ml_gtk_accessible_list_new_from_array"

(* Methods *)
