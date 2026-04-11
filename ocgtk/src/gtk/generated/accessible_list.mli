(* GENERATED CODE - DO NOT EDIT *)
(* AccessibleList: AccessibleList *)

type t = [ `accessible_list ] Gobject.obj
(** A boxed type which wraps a list of references to GtkAccessible objects. *)

external new_from_array :
  At_context_and__accessible.Accessible.t array -> Gsize.t -> t
  = "ml_gtk_accessible_list_new_from_array"
(** Create a new AccessibleList *)

(* Methods *)
