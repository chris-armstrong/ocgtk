(** [GSimplePermission] is a trivial implementation of [Gio.Permission] that
    represents a permission that is either always or never allowed. The value is
    given at construction and doesn’t change.

    Calling [Gio.Permission.acquire] or [Gio.Permission.release] on a
    [GSimplePermission] will result in errors.

    Its methods, signals and properties are on
    {!class-type-simple_permission_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Simple_permission}. *)

(** The methods, signals and properties of a [SimplePermission]. *)
class type simple_permission_t = object
  inherit Permission.permission_t
  method as_simple_permission : Raw.Simple_permission.t
end

class simple_permission : Raw.Simple_permission.t -> simple_permission_t
(** Wraps a raw handle of {!Ocgio.Raw.Simple_permission.t}. *)

(** {2:constructors Constructors} *)

val new_ : bool -> simple_permission_t
(** Creates a new [GPermission] instance that represents an action that is
    either always or never allowed. *)
