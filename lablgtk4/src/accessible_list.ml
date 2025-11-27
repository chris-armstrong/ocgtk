(* GENERATED CODE - DO NOT EDIT *)
(* Record: AccessibleList *)

(** A boxed type which wraps a list of references to GtkAccessible objects. *)
type t = Obj.t

(** Create a new AccessibleList *)
external new_from_array : unit -> unit -> t = "ml_gtk_accessible_list_new_from_array"

(** Create a new AccessibleList *)
external new_from_list : unit -> t = "ml_gtk_accessible_list_new_from_list"

