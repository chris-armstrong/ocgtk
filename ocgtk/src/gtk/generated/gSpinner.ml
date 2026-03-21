class type spinner_t = object
    method get_spinning : unit -> bool
    method set_spinning : bool -> unit
    method start : unit -> unit
    method stop : unit -> unit
    method as_spinner : Spinner.t
end

(* High-level class for Spinner *)
class spinner (obj : Spinner.t) : spinner_t = object (self)

  method get_spinning : unit -> bool =
    fun () ->
      (Spinner.get_spinning obj)

  method set_spinning : bool -> unit =
    fun spinning ->
      (Spinner.set_spinning obj spinning)

  method start : unit -> unit =
    fun () ->
      (Spinner.start obj)

  method stop : unit -> unit =
    fun () ->
      (Spinner.stop obj)

    method as_spinner = obj
end

