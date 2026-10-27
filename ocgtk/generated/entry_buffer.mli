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
  method emit_deleted_text : int -> int -> unit
  method emit_inserted_text : int -> string -> int -> unit
  method get_bytes : unit -> Gsize.t
  method get_length : unit -> int
  method get_max_length : unit -> int
  method get_text : unit -> string
  method insert_text : int -> string -> int -> int
  method set_max_length : int -> unit
  method set_text : string -> int -> unit
  method as_entry_buffer : Raw.Entry_buffer.t
end

class entry_buffer : Raw.Entry_buffer.t -> entry_buffer_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Entry_buffer.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkEntryBuffer], give one already wrapped. *)

val new_ : string option -> int -> entry_buffer_t
