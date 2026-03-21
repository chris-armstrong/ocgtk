class type spinner_t = object
    method get_spinning : unit -> bool
    method set_spinning : bool -> unit
    method start : unit -> unit
    method stop : unit -> unit
    method as_spinner : Spinner.t
end

class spinner : Spinner.t -> spinner_t

