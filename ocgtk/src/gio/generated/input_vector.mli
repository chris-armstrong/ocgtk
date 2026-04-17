(* GENERATED CODE - DO NOT EDIT *)
(* InputVector: InputVector *)

(** Structure used for scatter/gather data input.
You generally pass in an array of #GInputVectors
and the operation will store the read data starting in the
first buffer, switching to the next as needed. *)
type t = [`input_vector] Gobject.obj

(* Methods *)
