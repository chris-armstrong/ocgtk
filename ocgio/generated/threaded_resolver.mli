(** [GThreadedResolver] is an implementation of [GResolver] which calls the libc
    lookup functions in threads to allow them to run asynchronously.

    Its methods, signals and properties are on
    {!class-type-threaded_resolver_t}. The functions it is built on are in
    {!Ocgio.Raw.Threaded_resolver}. *)

(** The methods, signals and properties of a [GThreadedResolver]. *)
class type threaded_resolver_t = object
  inherit Resolver.resolver_t
  method as_threaded_resolver : Raw.Threaded_resolver.t
end

class threaded_resolver : Raw.Threaded_resolver.t -> threaded_resolver_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Threaded_resolver.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GThreadedResolver], give one already wrapped. *)
