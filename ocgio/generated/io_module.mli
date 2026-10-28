(** Provides an interface and default functions for loading and unloading
    modules. This is used internally to make GIO extensible, but can also be
    used by others to implement module loading.

    Its methods, signals and properties are on {!class-type-io_module_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.Io_module}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [IOModule].}

    Inherits from: [GObject.TypeModule]

    Implements:
    - [GObject.TypePlugin]

    Provides an interface and default functions for loading and unloading
    modules. This is used internally to make GIO extensible, but can also be
    used by others to implement module loading. *)
class type io_module_t = object
  (** {2:conversions Conversions} *)

  method as_io_module : Raw.Io_module.t
end

class io_module : Raw.Io_module.t -> io_module_t
(** Wraps a raw handle of {!Ocgio.Raw.Io_module.t}. *)

(** {1:constructors Constructors} *)

val new_ : string -> io_module_t
(** Creates a new GIOModule that will load the specific shared library when in
    use. *)
