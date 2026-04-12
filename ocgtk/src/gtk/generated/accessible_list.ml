(* GENERATED CODE - DO NOT EDIT *)
(* AccessibleList: AccessibleList *)

(** A boxed type which wraps a list of references to GtkAccessible objects. *)
type t = [`accessible_list] Gobject.obj

(** Create a new AccessibleList *)
external new_from_list : At_context_and__accessible.Accessible.t list -> t = "ml_gtk_accessible_list_new_from_list"

(* Methods *)
(** Gets the list of objects this boxed type holds *)
external get_objects : t -> At_context_and__accessible.Accessible.t list = "ml_gtk_accessible_list_get_objects"

