class buildable : Buildable.t ->
  object
    method get_buildable_id : unit -> string option
    method as_buildable : Buildable.t
  end

