class spinner : Spinner.t ->
  object
    method get_spinning : unit -> bool
    method set_spinning : bool -> unit
    method start : unit -> unit
    method stop : unit -> unit
    method as_spinner : Spinner.t
  end

