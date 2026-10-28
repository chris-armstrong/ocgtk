class type seekable_t = object
  (** {2:methods Methods} *)

  method can_seek : unit -> bool
  (** Tests if the stream supports the [GSeekableIface]. *)

  method can_truncate : unit -> bool
  (** Tests if the length of the stream can be adjusted with
      g_seekable_truncate(). *)

  method tell : unit -> int64
  (** Tells the current position within the stream. *)

  method truncate :
    int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Sets the length of the stream to [offset]. If the stream was previously
      larger than [offset], the extra data is discarded. If the stream was
      previously shorter than [offset], it is extended with NUL ('\0') bytes.

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error. *)

  (** {2:conversions Conversions} *)

  method as_seekable : Raw.Seekable.t
end

(* High-level class for Seekable *)
class seekable (obj : Raw.Seekable.t) : seekable_t =
  object (self)
    method can_seek : unit -> bool = fun () -> Raw.Seekable.can_seek obj
    method can_truncate : unit -> bool = fun () -> Raw.Seekable.can_truncate obj
    method tell : unit -> int64 = fun () -> Raw.Seekable.tell obj

    method truncate :
        int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun offset cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Seekable.truncate obj offset cancellable

    method as_seekable = obj
  end
