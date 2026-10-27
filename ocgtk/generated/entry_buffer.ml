class type entry_buffer_t = object
  method on_deleted_text :
    ?after:bool ->
    callback:(position:int -> n_chars:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_inserted_text :
    ?after:bool ->
    callback:(position:int -> chars:string -> n_chars:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method delete_text : int -> int -> int
  (** Deletes a sequence of characters from the buffer.

      [n_chars] characters are deleted starting at [position]. If [n_chars] is
      negative, then all characters until the end of the text are deleted.

      If [position] or [n_chars] are out of bounds, then they are coerced to
      sane values.

      Note that the positions are specified in characters, not bytes. *)

  method emit_deleted_text : int -> int -> unit
  (** Used when subclassing [GtkEntryBuffer]. *)

  method emit_inserted_text : int -> string -> int -> unit
  (** Used when subclassing [GtkEntryBuffer]. *)

  method get_bytes : unit -> Gsize.t
  (** Retrieves the length in bytes of the buffer.

      See [Gtk.EntryBuffer.get_length]. *)

  method get_length : unit -> int
  (** Retrieves the length in characters of the buffer. *)

  method get_max_length : unit -> int
  (** Retrieves the maximum allowed length of the text in [buffer]. *)

  method get_text : unit -> string
  (** Retrieves the contents of the buffer.

      The memory pointer returned by this call will not change unless this
      object emits a signal, or is finalized. *)

  method insert_text : int -> string -> int -> int
  (** Inserts [n_chars] characters of [chars] into the contents of the buffer,
      at position [position].

      If [n_chars] is negative, then characters from chars will be inserted
      until a null-terminator is found. If [position] or [n_chars] are out of
      bounds, or the maximum buffer text length is exceeded, then they are
      coerced to sane values.

      Note that the position and length are in characters, not in bytes. *)

  method set_max_length : int -> unit
  (** Sets the maximum allowed length of the contents of the buffer.

      If the current contents are longer than the given length, then they will
      be truncated to fit. *)

  method set_text : string -> int -> unit
  (** Sets the text in the buffer.

      This is roughly equivalent to calling [Gtk.EntryBuffer.delete_text] and
      [Gtk.EntryBuffer.insert_text].

      Note that [n_chars] is in characters, not in bytes. *)

  method as_entry_buffer : Raw.Entry_buffer.t
end

(* High-level class for EntryBuffer *)
class entry_buffer (obj : Raw.Entry_buffer.t) : entry_buffer_t =
  object (self)
    method on_deleted_text ?(after = false) ~callback () =
      Raw.Entry_buffer.on_deleted_text ~after self#as_entry_buffer ~callback

    method on_inserted_text ?(after = false) ~callback () =
      Raw.Entry_buffer.on_inserted_text ~after self#as_entry_buffer ~callback

    method delete_text : int -> int -> int =
      fun position n_chars -> Raw.Entry_buffer.delete_text obj position n_chars

    method emit_deleted_text : int -> int -> unit =
      fun position n_chars ->
        Raw.Entry_buffer.emit_deleted_text obj position n_chars

    method emit_inserted_text : int -> string -> int -> unit =
      fun position chars n_chars ->
        Raw.Entry_buffer.emit_inserted_text obj position chars n_chars

    method get_bytes : unit -> Gsize.t =
      fun () -> Raw.Entry_buffer.get_bytes obj

    method get_length : unit -> int = fun () -> Raw.Entry_buffer.get_length obj

    method get_max_length : unit -> int =
      fun () -> Raw.Entry_buffer.get_max_length obj

    method get_text : unit -> string = fun () -> Raw.Entry_buffer.get_text obj

    method insert_text : int -> string -> int -> int =
      fun position chars n_chars ->
        Raw.Entry_buffer.insert_text obj position chars n_chars

    method set_max_length : int -> unit =
      fun max_length -> Raw.Entry_buffer.set_max_length obj max_length

    method set_text : string -> int -> unit =
      fun chars n_chars -> Raw.Entry_buffer.set_text obj chars n_chars

    method as_entry_buffer = obj
  end

let new_ (initial_chars : string option) (n_initial_chars : int) :
    entry_buffer_t =
  let obj_ = Raw.Entry_buffer.new_ initial_chars n_initial_chars in
  new entry_buffer obj_
