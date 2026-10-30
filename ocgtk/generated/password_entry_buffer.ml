class type password_entry_buffer_t = object
  inherit Entry_buffer.entry_buffer_t

  (** {2:conversions Conversions} *)

  method as_password_entry_buffer : Raw.Password_entry_buffer.t
end

(* High-level class for PasswordEntryBuffer *)
class password_entry_buffer (obj : Raw.Password_entry_buffer.t) :
  password_entry_buffer_t =
  object (self)
    inherit Entry_buffer.entry_buffer (obj :> Raw.Entry_buffer.t)
    method as_password_entry_buffer = obj
  end

let new_ () : password_entry_buffer_t =
  new password_entry_buffer (Raw.Password_entry_buffer.new_ ())
