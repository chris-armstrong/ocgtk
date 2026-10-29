(* GENERATED CODE - DO NOT EDIT *)
(* ThreadedResolver: ThreadedResolver *)

(** {{!Ocgio.Raw.Threaded_resolver}[GThreadedResolver]} is an implementation of
    {{!Ocgio.Raw.Resolver}[GResolver]} which calls the libc lookup functions in
    threads to allow them to run asynchronously.

    The class built on this module is in {!Ocgio.Threaded_resolver}. *)

type t = [ `threaded_resolver | `resolver | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_threaded_resolver_get_type"

(* Methods *)
