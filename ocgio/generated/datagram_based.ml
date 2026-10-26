class type datagram_based_t = object
  method receive_messages :
    Raw.Input_message.t array ->
    int ->
    int ->
    int64 ->
    Cancellable.cancellable_t option ->
    (int, GError.t) result

  method send_messages :
    Raw.Output_message.t array ->
    int ->
    int ->
    int64 ->
    Cancellable.cancellable_t option ->
    (int, GError.t) result

  method as_datagram_based : Raw.Datagram_based.t
end

(* High-level class for DatagramBased *)
class datagram_based (obj : Raw.Datagram_based.t) : datagram_based_t =
  object (self)
    method receive_messages :
        Raw.Input_message.t array ->
        int ->
        int ->
        int64 ->
        Cancellable.cancellable_t option ->
        (int, GError.t) result =
      fun messages num_messages flags timeout cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Datagram_based.receive_messages obj messages num_messages flags
          timeout cancellable

    method send_messages :
        Raw.Output_message.t array ->
        int ->
        int ->
        int64 ->
        Cancellable.cancellable_t option ->
        (int, GError.t) result =
      fun messages num_messages flags timeout cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Datagram_based.send_messages obj messages num_messages flags timeout
          cancellable

    method as_datagram_based = obj
  end
