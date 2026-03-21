class type datagram_based_t = object
    method as_datagram_based : Datagram_based.t
end

class datagram_based : Datagram_based.t -> datagram_based_t

