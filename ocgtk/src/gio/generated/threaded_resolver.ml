(* GENERATED CODE - DO NOT EDIT *)
(* ThreadedResolver: ThreadedResolver *)

type t = [ `threaded_resolver | `resolver | `object_ ] Gobject.obj
(** [GThreadedResolver] is an implementation of [GResolver] which calls the libc
    lookup functions in threads to allow them to run asynchronously. *)

(* Methods *)
