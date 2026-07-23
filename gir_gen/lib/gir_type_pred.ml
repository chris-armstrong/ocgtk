module Gir_direction = struct
  type t = Types.gir_direction = In | Out | InOut

  let is_in = function In | InOut -> true | Out -> false
  let is_in_only = function In -> true | Out | InOut -> false
  let has_output = function Out | InOut -> true | In -> false
end
