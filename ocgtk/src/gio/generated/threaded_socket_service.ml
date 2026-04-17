(* GENERATED CODE - DO NOT EDIT *)
(* ThreadedSocketService: ThreadedSocketService *)

type t = [`threaded_socket_service | `socket_service | `socket_listener | `object_] Gobject.obj

(** Create a new ThreadedSocketService *)
external new_ : int -> t = "ml_g_threaded_socket_service_new"

(* Methods *)
(* Properties *)

(** Get property: max-threads *)
external get_max_threads : t -> int = "ml_g_threaded_socket_service_get_max_threads"

