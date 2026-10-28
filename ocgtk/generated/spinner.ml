class type spinner_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_spinning : unit -> bool
  (** Returns whether the spinner is spinning. *)

  method set_spinning : bool -> unit
  (** Sets the activity of the spinner. *)

  method start : unit -> unit
  (** Starts the animation of the spinner. *)

  method stop : unit -> unit
  (** Stops the animation of the spinner. *)

  (** {2:conversions Conversions} *)

  method as_spinner : Raw.Spinner.t
end

(* High-level class for Spinner *)
class spinner (obj : Raw.Spinner.t) : spinner_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    method get_spinning : unit -> bool = fun () -> Raw.Spinner.get_spinning obj

    method set_spinning : bool -> unit =
      fun spinning -> Raw.Spinner.set_spinning obj spinning

    method start : unit -> unit = fun () -> Raw.Spinner.start obj
    method stop : unit -> unit = fun () -> Raw.Spinner.stop obj
    method as_spinner = obj
  end

let new_ () : spinner_t = new spinner (Raw.Spinner.new_ ())
