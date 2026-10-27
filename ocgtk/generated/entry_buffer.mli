(** Holds the text that is displayed in a single-line text entry widget.

    A single [GtkEntryBuffer] object can be shared by multiple widgets which
    will then share the same text content, but not the cursor position,
    visibility attributes, icon etc.

    [GtkEntryBuffer] may be derived from. Such a derived class might allow text
    to be stored in an alternate location, such as non-pageable memory, useful
    in the case of important passwords. Or a derived class could integrate with
    an application’s concept of undo/redo.

    Its methods, signals and properties are on {!class-type-entry_buffer_t}. The
    functions it is built on are in {!Ocgtk.Raw.Entry_buffer}. *)

(** The methods, signals and properties of a [GtkEntryBuffer]. *)
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

class entry_buffer : Raw.Entry_buffer.t -> entry_buffer_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Entry_buffer.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkEntryBuffer], give one already wrapped. *)

val new_ : string option -> int -> entry_buffer_t
