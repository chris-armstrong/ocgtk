(* High-level class for Bitset *)
class bitset (obj : Bitset.t) = object (self)

  method add : int -> bool =
    fun value ->
      (Bitset.add obj value)

  method add_range : int -> int -> unit =
    fun start n_items ->
      (Bitset.add_range obj start n_items)

  method add_range_closed : int -> int -> unit =
    fun first last ->
      (Bitset.add_range_closed obj first last)

  method add_rectangle : int -> int -> int -> int -> unit =
    fun start width height stride ->
      (Bitset.add_rectangle obj start width height stride)

  method contains : int -> bool =
    fun value ->
      (Bitset.contains obj value)

  method copy : unit -> Bitset.t =
    fun () ->
      (Bitset.copy obj)

  method difference : Bitset.t -> unit =
    fun other ->
      (Bitset.difference obj other)

  method equals : Bitset.t -> bool =
    fun other ->
      (Bitset.equals obj other)

  method get_maximum : unit -> int =
    fun () ->
      (Bitset.get_maximum obj)

  method get_minimum : unit -> int =
    fun () ->
      (Bitset.get_minimum obj)

  method get_nth : int -> int =
    fun nth ->
      (Bitset.get_nth obj nth)

  method intersect : Bitset.t -> unit =
    fun other ->
      (Bitset.intersect obj other)

  method is_empty : unit -> bool =
    fun () ->
      (Bitset.is_empty obj)

  method ref : unit -> Bitset.t =
    fun () ->
      (Bitset.ref obj)

  method remove : int -> bool =
    fun value ->
      (Bitset.remove obj value)

  method remove_all : unit -> unit =
    fun () ->
      (Bitset.remove_all obj)

  method remove_range : int -> int -> unit =
    fun start n_items ->
      (Bitset.remove_range obj start n_items)

  method remove_range_closed : int -> int -> unit =
    fun first last ->
      (Bitset.remove_range_closed obj first last)

  method remove_rectangle : int -> int -> int -> int -> unit =
    fun start width height stride ->
      (Bitset.remove_rectangle obj start width height stride)

  method shift_left : int -> unit =
    fun amount ->
      (Bitset.shift_left obj amount)

  method shift_right : int -> unit =
    fun amount ->
      (Bitset.shift_right obj amount)

  method splice : int -> int -> int -> unit =
    fun position removed added ->
      (Bitset.splice obj position removed added)

  method subtract : Bitset.t -> unit =
    fun other ->
      (Bitset.subtract obj other)

  method union : Bitset.t -> unit =
    fun other ->
      (Bitset.union obj other)

  method unref : unit -> unit =
    fun () ->
      (Bitset.unref obj)

    method as_bitset = obj
end

