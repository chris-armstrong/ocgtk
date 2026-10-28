(** A [GtkEntryBuffer] that locks the underlying memory to prevent it from being
    swapped to disk.

    Its methods, signals and properties are on
    {!class-type-password_entry_buffer_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Password_entry_buffer}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PasswordEntryBuffer].}

    A [GtkEntryBuffer] that locks the underlying memory to prevent it from being
    swapped to disk.

    [GtkPasswordEntry] uses a [GtkPasswordEntryBuffer]. *)
class type password_entry_buffer_t = object
  inherit Entry_buffer.entry_buffer_t
  method as_password_entry_buffer : Raw.Password_entry_buffer.t
end

class password_entry_buffer :
  Raw.Password_entry_buffer.t ->
  password_entry_buffer_t
(** Wraps a raw handle of {!Ocgtk.Raw.Password_entry_buffer.t}. *)

(** {1:description Description}

    A [GtkEntryBuffer] that locks the underlying memory to prevent it from being
    swapped to disk.

    [GtkPasswordEntry] uses a [GtkPasswordEntryBuffer]. *)

(** {1:constructors Constructors} *)

val new_ : unit -> password_entry_buffer_t
(** Creates a new [GtkEntryBuffer] using secure memory allocations. *)
