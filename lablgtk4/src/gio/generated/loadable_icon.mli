(* GENERATED CODE - DO NOT EDIT *)
(* LoadableIcon: LoadableIcon *)

type t = [`loadable_icon] Gobject.obj

(* Methods *)
(** Loads a loadable icon. For the asynchronous version of this function,
see g_loadable_icon_load_async(). *)
external load : t -> int -> Cancellable.t option -> (Input_stream.t * string, GError.t) result = "ml_g_loadable_icon_load"

