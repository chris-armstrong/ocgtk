(* GENERATED CODE - DO NOT EDIT *)
(* AsyncResult: AsyncResult *)

type t = [`async_result] Gobject.obj

(* Methods *)
(** If @res is a #GSimpleAsyncResult, this is equivalent to
g_simple_async_result_propagate_error(). Otherwise it returns
%FALSE.

This can be used for legacy error handling in async *_finish()
wrapper functions that traditionally handled #GSimpleAsyncResult
error returns themselves rather than calling into the virtual method.
This should not be used in new code; #GAsyncResult errors that are
set by virtual methods should also be extracted by virtual methods,
to enable subclasses to chain up correctly. *)
external legacy_propagate_error : t -> (bool, GError.t) result = "ml_g_async_result_legacy_propagate_error"

