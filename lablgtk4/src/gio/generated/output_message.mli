(* GENERATED CODE - DO NOT EDIT *)
(* OutputMessage: OutputMessage *)

(** Structure used for scatter/gather data output when sending multiple
messages or packets in one go. You generally pass in an array of
#GOutputVectors and the operation will use all the buffers as if they
were one buffer.

If @address is %NULL then the message is sent to the default receiver
(as previously set by g_socket_connect()). *)
type t = [`output_message] Gobject.obj

(* Methods *)
