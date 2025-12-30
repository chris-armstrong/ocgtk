class entry_buffer : Entry_buffer.t ->
  object
    inherit Gentry_buffer_signals.entry_buffer_signals
    method delete_text : int -> int -> int
    method emit_deleted_text : int -> int -> unit
    method emit_inserted_text : int -> string -> int -> unit
    method get_length : unit -> int
    method get_max_length : unit -> int
    method get_text : unit -> string
    method insert_text : int -> string -> int -> int
    method set_max_length : int -> unit
    method set_text : string -> int -> unit
    method as_entry_buffer : Entry_buffer.t
  end

