(* GENERATED CODE - DO NOT EDIT *)
(* ThreadedResolver: ThreadedResolver *)

(** [GThreadedResolver] is an implementation of [GResolver] which calls the libc
    lookup functions in threads to allow them to run asynchronously. *)

type t = [ `threaded_resolver | `resolver | `object_ ] Gobject.obj

(* Methods *)
