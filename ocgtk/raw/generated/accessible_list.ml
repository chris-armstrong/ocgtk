(* GENERATED CODE - DO NOT EDIT *)
(* AccessibleList: AccessibleList *)

(** Wraps a list of references to {{!Ocgtk.Raw.Accessible}[Gtk.Accessible]}
    objects.

    The class built on this module is in {!Ocgtk.Accessible_list}. *)

type t = [ `accessible_list ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_accessible_list_get_type"

external new_from_array :
  At_context_and__accessible.Accessible.t array -> Gsize.t -> t
  = "ml_gtk_accessible_list_new_from_array"
(** Allocates a new list of accessible objects. *)

external new_from_list : At_context_and__accessible.Accessible.t list -> t
  = "ml_gtk_accessible_list_new_from_list"
(** Allocates a new [GtkAccessibleList], doing a shallow copy of the passed list
    of accessible objects *)

(* Methods *)

external get_objects : t -> At_context_and__accessible.Accessible.t list
  = "ml_gtk_accessible_list_get_objects"
(** Gets the list of objects this boxed type holds. *)
