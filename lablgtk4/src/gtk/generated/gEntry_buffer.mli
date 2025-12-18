class entry_buffer : Entry_buffer.t ->
  object
    inherit Gentry_buffer_signals.entry_buffer_signals
    method length : int
    method max_length : int
    method set_max_length : int -> unit
    method text : string
    method set_text : string -> unit
    method delete_text : int -> int -> int
    method emit_deleted_text : int -> int -> unit
    method emit_inserted_text : int -> string -> int -> unit
    method insert_text : int -> string -> int -> int
    method as_entry_buffer : Entry_buffer.t
  end

