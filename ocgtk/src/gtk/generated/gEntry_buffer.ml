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

(* High-level class for EntryBuffer *)
class entry_buffer (obj : Entry_buffer.t) : entry_buffer_t =
  object (self)
    method on_deleted_text ~callback =
      Entry_buffer.on_deleted_text self#as_entry_buffer ~callback

    method on_inserted_text ~callback =
      Entry_buffer.on_inserted_text self#as_entry_buffer ~callback

    method delete_text : int -> int -> int =
      fun position n_chars -> Entry_buffer.delete_text obj position n_chars

    method emit_deleted_text : int -> int -> unit =
      fun position n_chars ->
        Entry_buffer.emit_deleted_text obj position n_chars

    method emit_inserted_text : int -> string -> int -> unit =
      fun position chars n_chars ->
        Entry_buffer.emit_inserted_text obj position chars n_chars

    method get_bytes : unit -> Gsize.t = fun () -> Entry_buffer.get_bytes obj
    method get_length : unit -> int = fun () -> Entry_buffer.get_length obj

    method get_max_length : unit -> int =
      fun () -> Entry_buffer.get_max_length obj

    method get_text : unit -> string = fun () -> Entry_buffer.get_text obj

    method insert_text : int -> string -> int -> int =
      fun position chars n_chars ->
        Entry_buffer.insert_text obj position chars n_chars

    method set_max_length : int -> unit =
      fun max_length -> Entry_buffer.set_max_length obj max_length

    method set_text : string -> int -> unit =
      fun chars n_chars -> Entry_buffer.set_text obj chars n_chars

    method as_entry_buffer = obj
  end

let new_ (initial_chars : string option) (n_initial_chars : int) :
    entry_buffer_t =
  let obj_ = Entry_buffer.new_ initial_chars n_initial_chars in
  new entry_buffer obj_
