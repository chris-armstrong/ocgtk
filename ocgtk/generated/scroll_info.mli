(** Provides detailed information on how a scroll operation should be performed.

    Scrolling functions usually allow passing a [NULL] scroll info which will
    cause the default values to be used and just scroll the element into view.

    Its methods, signals and properties are on {!class-type-scroll_info_t}. The
    functions it is built on are in {!Ocgtk.Raw.Scroll_info}. *)

(** The methods, signals and properties of a [GtkScrollInfo]. *)
class type scroll_info_t = object
  method get_enable_horizontal : unit -> bool
  method get_enable_vertical : unit -> bool
  method ref : unit -> Raw.Scroll_info.t
  method set_enable_horizontal : bool -> unit
  method set_enable_vertical : bool -> unit
  method as_scroll_info : Raw.Scroll_info.t
end

class scroll_info : Raw.Scroll_info.t -> scroll_info_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Scroll_info.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkScrollInfo], give one already wrapped. *)

val new_ : unit -> scroll_info_t
