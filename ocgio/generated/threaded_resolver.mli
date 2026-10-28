(** [GThreadedResolver] is an implementation of [GResolver] which calls the libc
    lookup functions in threads to allow them to run asynchronously.

    Its methods, signals and properties are on
    {!class-type-threaded_resolver_t}. The functions it is built on are in
    {!Ocgio.Raw.Threaded_resolver}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ThreadedResolver].}

    [GThreadedResolver] is an implementation of [GResolver] which calls the libc
    lookup functions in threads to allow them to run asynchronously. *)
class type threaded_resolver_t = object
  inherit Resolver.resolver_t

  (** {2:conversions Conversions} *)

  method as_threaded_resolver : Raw.Threaded_resolver.t
end

class threaded_resolver : Raw.Threaded_resolver.t -> threaded_resolver_t
(** Wraps a raw handle of {!Ocgio.Raw.Threaded_resolver.t}. *)
