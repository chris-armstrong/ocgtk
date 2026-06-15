(* GENERATED CODE - DO NOT EDIT *)
(* InputVector: InputVector *)

type t = [ `input_vector ] Gobject.obj
(** Structure used for scatter/gather data input. You generally pass in an array
    of #GInputVectors and the operation will store the read data starting in the
    first buffer, switching to the next as needed. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_size : t -> Gsize.t = "ml_g_input_vector_get_size"

(* Setters *)
external set_size : t -> Gsize.t -> unit = "ml_g_input_vector_set_size"
external make : Gsize.t -> t = "ml_g_input_vector_make"
