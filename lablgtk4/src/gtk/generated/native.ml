(* GENERATED CODE - DO NOT EDIT *)
(* Native: Native *)

type t = [`native] Gobject.obj

(** Unrealizes a `GtkNative`.

This should only be used by subclasses. *)
external unrealize : t -> unit = "ml_gtk_native_unrealize"

(** Realizes a `GtkNative`.

This should only be used by subclasses. *)
external realize : t -> unit = "ml_gtk_native_realize"

