class type output_message_t = object
  (** {2:conversions Conversions} *)

  method as_output_message : Raw.Output_message.t
end

(* High-level class for OutputMessage *)
class output_message (obj : Raw.Output_message.t) : output_message_t =
  object (self)
    method as_output_message = obj
  end
