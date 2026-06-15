(* GENERATED CODE - DO NOT EDIT *)
(* OutputVector: OutputVector *)

type t = [ `output_vector ] Gobject.obj
(** Structure used for scatter/gather data output. You generally pass in an
    array of #GOutputVectors and the operation will use all the buffers as if
    they were one buffer. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_size : t -> Gsize.t = "ml_g_output_vector_get_size"

(* Setters *)
external set_size : t -> Gsize.t -> unit = "ml_g_output_vector_set_size"
external make : Gsize.t -> t = "ml_g_output_vector_make"
