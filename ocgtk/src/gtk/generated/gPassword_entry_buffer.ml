class type password_entry_buffer_t = object
    inherit GEntry_buffer.entry_buffer_t
    method as_password_entry_buffer : Password_entry_buffer.t
end

(* High-level class for PasswordEntryBuffer *)
class password_entry_buffer (obj : Password_entry_buffer.t) : password_entry_buffer_t = object (self)
  inherit GEntry_buffer.entry_buffer (Obj.magic obj : Entry_buffer.t)

    method as_password_entry_buffer = obj
end

