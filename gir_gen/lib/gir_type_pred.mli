module Gir_direction : sig
  type t = Types.gir_direction = In | Out | InOut

  val is_in : t -> bool
  (** [is_in d] is [true] if [d] is [In] or [InOut] (i.e. the parameter receives
      a value from the caller). *)

  val is_in_only : t -> bool
  (** [is_in_only d] is [true] if [d] is [In] but NOT [InOut] (pure input only).
  *)

  val has_output : t -> bool
  (** [has_output d] is [true] if [d] is [Out] or [InOut] (i.e. the parameter
      produces a value for the caller). *)
end
