class type datagram_based_t = object
  method receive_messages :
    Input_message.t array ->
    int ->
    int ->
    int64 ->
    GCancellable.cancellable_t option ->
    (int, GError.t) result

  method send_messages :
    Output_message.t array ->
    int ->
    int ->
    int64 ->
    GCancellable.cancellable_t option ->
    (int, GError.t) result

  method as_datagram_based : Datagram_based.t
end

class datagram_based : Datagram_based.t -> datagram_based_t
