(* GENERATED CODE - DO NOT EDIT *)
(* StringObject: StringObject *)

type t = [`string_object | `object_] Gobject.obj

(** Create a new StringObject *)
external new_ : string -> t = "ml_gtk_string_object_new"

(* Properties *)

(** Get property: string *)
external get_string : t -> string = "ml_gtk_string_object_get_string"

