class type filter_output_stream_t = object
  inherit Output_stream.output_stream_t

  (** {2:methods Methods} *)

  method get_base_stream : unit -> Output_stream.output_stream_t
  (** Gets the base stream for the filter stream. *)

  method get_close_base_stream : unit -> bool
  (** Returns whether the base stream will be closed when [stream] is closed. *)

  method set_close_base_stream : bool -> unit
  (** Sets whether the base stream will be closed when [stream] is closed. *)

  (** {2:conversions Conversions} *)

  method as_filter_output_stream : Raw.Filter_output_stream.t
end

(* High-level class for FilterOutputStream *)
class filter_output_stream (obj : Raw.Filter_output_stream.t) :
  filter_output_stream_t =
  object (self)
    inherit Output_stream.output_stream (obj :> Raw.Output_stream.t)

    method get_base_stream : unit -> Output_stream.output_stream_t =
      fun () ->
        new Output_stream.output_stream
          (Raw.Filter_output_stream.get_base_stream obj)

    method get_close_base_stream : unit -> bool =
      fun () -> Raw.Filter_output_stream.get_close_base_stream obj

    method set_close_base_stream : bool -> unit =
      fun close_base ->
        Raw.Filter_output_stream.set_close_base_stream obj close_base

    method as_filter_output_stream = obj
  end
