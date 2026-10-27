(** A [GtkEntryBuffer] that locks the underlying memory to prevent it from being
    swapped to disk.

    [GtkPasswordEntry] uses a [GtkPasswordEntryBuffer].

    Its methods, signals and properties are on
    {!class-type-password_entry_buffer_t}. The functions it is built on are in
    {!Ocgtk.Raw.Password_entry_buffer}. *)

(** The methods, signals and properties of a [GtkPasswordEntryBuffer]. *)
class type password_entry_buffer_t = object
  inherit Entry_buffer.entry_buffer_t
  method as_password_entry_buffer : Raw.Password_entry_buffer.t
end

class password_entry_buffer :
  Raw.Password_entry_buffer.t ->
  password_entry_buffer_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Password_entry_buffer.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkPasswordEntryBuffer], give one already wrapped. *)

val new_ : unit -> password_entry_buffer_t
