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

class datagram_based : Raw.Datagram_based.t -> datagram_based_t
