class type datagram_based_t = object
    method as_datagram_based : Datagram_based.t
end

(* High-level class for DatagramBased *)
class datagram_based (obj : Datagram_based.t) : datagram_based_t = object (self)

    method as_datagram_based = obj
end

