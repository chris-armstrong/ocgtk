class type bitset_t = object
  method add : int -> bool
  method add_range : int -> int -> unit
  method add_range_closed : int -> int -> unit
  method add_rectangle : int -> int -> int -> int -> unit
  method contains : int -> bool
  method difference : Raw.Bitset.t -> unit
  method equals : Raw.Bitset.t -> bool
  method get_maximum : unit -> int
  method get_minimum : unit -> int
  method get_nth : int -> int
  method get_size : unit -> UInt64.t
  method get_size_in_range : int -> int -> UInt64.t
  method intersect : Raw.Bitset.t -> unit
  method is_empty : unit -> bool
  method ref : unit -> Raw.Bitset.t
  method remove : int -> bool
  method remove_all : unit -> unit
  method remove_range : int -> int -> unit
  method remove_range_closed : int -> int -> unit
  method remove_rectangle : int -> int -> int -> int -> unit
  method shift_left : int -> unit
  method shift_right : int -> unit
  method splice : int -> int -> int -> unit
  method subtract : Raw.Bitset.t -> unit
  method union : Raw.Bitset.t -> unit
  method as_bitset : Raw.Bitset.t
end

(* High-level class for Bitset *)
class bitset (obj : Raw.Bitset.t) : bitset_t =
  object (self)
    method add : int -> bool = fun value -> Raw.Bitset.add obj value

    method add_range : int -> int -> unit =
      fun start n_items -> Raw.Bitset.add_range obj start n_items

    method add_range_closed : int -> int -> unit =
      fun first last -> Raw.Bitset.add_range_closed obj first last

    method add_rectangle : int -> int -> int -> int -> unit =
      fun start width height stride ->
        Raw.Bitset.add_rectangle obj start width height stride

    method contains : int -> bool = fun value -> Raw.Bitset.contains obj value

    method difference : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.difference obj other

    method equals : Raw.Bitset.t -> bool =
      fun other -> Raw.Bitset.equals obj other

    method get_maximum : unit -> int = fun () -> Raw.Bitset.get_maximum obj
    method get_minimum : unit -> int = fun () -> Raw.Bitset.get_minimum obj
    method get_nth : int -> int = fun nth -> Raw.Bitset.get_nth obj nth
    method get_size : unit -> UInt64.t = fun () -> Raw.Bitset.get_size obj

    method get_size_in_range : int -> int -> UInt64.t =
      fun first last -> Raw.Bitset.get_size_in_range obj first last

    method intersect : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.intersect obj other

    method is_empty : unit -> bool = fun () -> Raw.Bitset.is_empty obj
    method ref : unit -> Raw.Bitset.t = fun () -> Raw.Bitset.ref obj
    method remove : int -> bool = fun value -> Raw.Bitset.remove obj value
    method remove_all : unit -> unit = fun () -> Raw.Bitset.remove_all obj

    method remove_range : int -> int -> unit =
      fun start n_items -> Raw.Bitset.remove_range obj start n_items

    method remove_range_closed : int -> int -> unit =
      fun first last -> Raw.Bitset.remove_range_closed obj first last

    method remove_rectangle : int -> int -> int -> int -> unit =
      fun start width height stride ->
        Raw.Bitset.remove_rectangle obj start width height stride

    method shift_left : int -> unit =
      fun amount -> Raw.Bitset.shift_left obj amount

    method shift_right : int -> unit =
      fun amount -> Raw.Bitset.shift_right obj amount

    method splice : int -> int -> int -> unit =
      fun position removed added -> Raw.Bitset.splice obj position removed added

    method subtract : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.subtract obj other

    method union : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.union obj other

    method as_bitset = obj
  end

let new_empty () : bitset_t = new bitset (Raw.Bitset.new_empty ())

let new_range (start : int) (n_items : int) : bitset_t =
  let obj_ = Raw.Bitset.new_range start n_items in
  new bitset obj_
