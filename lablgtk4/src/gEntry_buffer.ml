(* Signal class defined in gentry_buffer_signals.ml *)

(* High-level class for EntryBuffer *)
class entry_buffer (obj : Entry_buffer.t) = object (self)
  inherit Gentry_buffer_signals.entry_buffer_signals obj

  method delete_text : int -> int -> int = fun position n_chars -> (Entry_buffer.delete_text obj position n_chars)

  method emit_deleted_text : int -> int -> unit = fun position n_chars -> (Entry_buffer.emit_deleted_text obj position n_chars)

  method emit_inserted_text : int -> string -> int -> unit = fun position chars n_chars -> (Entry_buffer.emit_inserted_text obj position chars n_chars)

  method get_length : unit -> int = fun () -> (Entry_buffer.get_length obj )

  method get_max_length : unit -> int = fun () -> (Entry_buffer.get_max_length obj )

  method get_text : unit -> string = fun () -> (Entry_buffer.get_text obj )

  method insert_text : int -> string -> int -> int = fun position chars n_chars -> (Entry_buffer.insert_text obj position chars n_chars)

  method set_max_length : int -> unit = fun max_length -> (Entry_buffer.set_max_length obj max_length)

  method set_text : string -> int -> unit = fun chars n_chars -> (Entry_buffer.set_text obj chars n_chars)

    method as_entry_buffer = obj
end

