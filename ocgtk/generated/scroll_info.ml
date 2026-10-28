class type scroll_info_t = object
  method get_enable_horizontal : unit -> bool
  (** Checks if horizontal scrolling is enabled. *)

  method get_enable_vertical : unit -> bool
  (** Checks if vertical scrolling is enabled. *)

  method ref : unit -> Raw.Scroll_info.t
  (** Increases the reference count of a [GtkScrollInfo] by one. *)

  method set_enable_horizontal : bool -> unit
  (** Turns horizontal scrolling on or off. *)

  method set_enable_vertical : bool -> unit
  (** Turns vertical scrolling on or off. *)

  method as_scroll_info : Raw.Scroll_info.t
end

(* High-level class for ScrollInfo *)
class scroll_info (obj : Raw.Scroll_info.t) : scroll_info_t =
  object (self)
    method get_enable_horizontal : unit -> bool =
      fun () -> Raw.Scroll_info.get_enable_horizontal obj

    method get_enable_vertical : unit -> bool =
      fun () -> Raw.Scroll_info.get_enable_vertical obj

    method ref : unit -> Raw.Scroll_info.t = fun () -> Raw.Scroll_info.ref obj

    method set_enable_horizontal : bool -> unit =
      fun horizontal -> Raw.Scroll_info.set_enable_horizontal obj horizontal

    method set_enable_vertical : bool -> unit =
      fun vertical -> Raw.Scroll_info.set_enable_vertical obj vertical

    method as_scroll_info = obj
  end

let new_ () : scroll_info_t = new scroll_info (Raw.Scroll_info.new_ ())
