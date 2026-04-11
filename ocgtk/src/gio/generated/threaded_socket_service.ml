(* GENERATED CODE - DO NOT EDIT *)
(* ThreadedSocketService: ThreadedSocketService *)

type t =
  [ `threaded_socket_service | `socket_service | `socket_listener | `object_ ]
  Gobject.obj

external new_ : int -> t = "ml_g_threaded_socket_service_new"
(** Create a new ThreadedSocketService *)

(* Methods *)
(* Properties *)

external get_max_threads : t -> int
  = "ml_g_threaded_socket_service_get_max_threads"
(** Get property: max-threads *)
