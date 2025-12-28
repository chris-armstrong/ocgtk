(* GENERATED CODE - DO NOT EDIT *)
(* AsyncInitable: AsyncInitable *)

type t = [`async_initable] Gobject.obj

(* Methods *)
(** Finishes asynchronous initialization and returns the result.
See g_async_initable_init_async(). *)
external init_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_async_initable_init_finish"

