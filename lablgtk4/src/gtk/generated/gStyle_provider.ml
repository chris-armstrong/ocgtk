(* Signal class defined in gstyle_provider_signals.ml *)

(* High-level class for StyleProvider *)
class style_provider (obj : Style_provider.t) = object (self)
  inherit Gstyle_provider_signals.style_provider_signals obj

    method as_style_provider = obj
end

