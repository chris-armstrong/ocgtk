class type scroll_info_t = object
  method get_enable_horizontal : unit -> bool
  method get_enable_vertical : unit -> bool
  method ref : unit -> Scroll_info.t
  method set_enable_horizontal : bool -> unit
  method set_enable_vertical : bool -> unit
  method as_scroll_info : Scroll_info.t
end

(* High-level class for ScrollInfo *)
class scroll_info (obj : Scroll_info.t) : scroll_info_t =
  object (self)
    method get_enable_horizontal : unit -> bool =
      fun () -> Scroll_info.get_enable_horizontal obj

    method get_enable_vertical : unit -> bool =
      fun () -> Scroll_info.get_enable_vertical obj

    method ref : unit -> Scroll_info.t = fun () -> Scroll_info.ref obj

    method set_enable_horizontal : bool -> unit =
      fun horizontal -> Scroll_info.set_enable_horizontal obj horizontal

    method set_enable_vertical : bool -> unit =
      fun vertical -> Scroll_info.set_enable_vertical obj vertical

    method as_scroll_info = obj
  end

let new_ () : scroll_info_t = new scroll_info (Scroll_info.new_ ())
