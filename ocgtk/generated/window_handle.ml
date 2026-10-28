class type window_handle_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [self]. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [self]. *)

  (** {2:conversions Conversions} *)

  method as_window_handle : Raw.Window_handle.t
end

(* High-level class for WindowHandle *)
class window_handle (obj : Raw.Window_handle.t) : window_handle_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Window_handle.get_child obj)

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Window_handle.set_child obj child

    method as_window_handle = obj
  end

let new_ () : window_handle_t = new window_handle (Raw.Window_handle.new_ ())
