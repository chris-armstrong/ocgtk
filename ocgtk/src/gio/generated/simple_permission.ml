(* GENERATED CODE - DO NOT EDIT *)
(* SimplePermission: SimplePermission *)

type t = [ `simple_permission | `permission | `object_ ] Gobject.obj
(** [GSimplePermission] is a trivial implementation of [Gio.Permission] that
    represents a permission that is either always or never allowed. The value is
    given at construction and doesn’t change.

    Calling [Gio.Permission.acquire] or [Gio.Permission.release] on a
    [GSimplePermission] will result in errors. *)

external new_ : bool -> t = "ml_g_simple_permission_new"
(** Create a new SimplePermission *)

(* Methods *)
