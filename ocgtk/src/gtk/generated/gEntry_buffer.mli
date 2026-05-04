class type entry_buffer_t = object
  method on_deleted_text :
    callback:(position:int -> n_chars:int -> unit) -> Gobject.Signal.handler_id

  method on_inserted_text :
    callback:(position:int -> chars:string -> n_chars:int -> unit) ->
    Gobject.Signal.handler_id

  method delete_text : int -> int -> int
  method emit_deleted_text : int -> int -> unit
  method emit_inserted_text : int -> string -> int -> unit
  method get_bytes : unit -> Gsize.t
  method get_length : unit -> int
  method get_max_length : unit -> int
  method get_text : unit -> string
  method insert_text : int -> string -> int -> int
  method set_max_length : int -> unit
  method set_text : string -> int -> unit
  method as_entry_buffer : Entry_buffer.t
end

class entry_buffer : Entry_buffer.t -> entry_buffer_t

val new_ : string option -> int -> entry_buffer_t
