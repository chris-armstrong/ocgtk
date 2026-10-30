(* GENERATED CODE - DO NOT EDIT *)
(* SimplePermission: SimplePermission *)

(** [GSimplePermission] is a trivial implementation of
    {{!Ocgio.Raw.Permission}[Gio.Permission]} that represents a permission that
    is either always or never allowed. The value is given at construction and
    doesn’t change.

    Calling {{!Ocgio.Raw.Permission.val-acquire}[Gio.Permission.acquire]} or
    {{!Ocgio.Raw.Permission.val-release}[Gio.Permission.release]} on a
    [GSimplePermission] will result in errors.

    The class built on this module is in {!Ocgio.Simple_permission}. *)

type t = [ `simple_permission | `permission | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_simple_permission_get_type"

external new_ : bool -> t = "ml_g_simple_permission_new"
(** Creates a new {{!Ocgio.Raw.Permission}[GPermission]} instance that
    represents an action that is either always or never allowed. *)

(* Methods *)
