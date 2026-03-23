class type password_entry_buffer_t = object
    inherit GEntry_buffer.entry_buffer_t
    method as_password_entry_buffer : Password_entry_buffer.t
end

class password_entry_buffer : Password_entry_buffer.t -> password_entry_buffer_t

val new_ : unit -> password_entry_buffer_t
