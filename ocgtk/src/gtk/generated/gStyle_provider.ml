(* Signal class defined in gstyle_provider_signals.ml *)

class type style_provider_t = object
    inherit Gstyle_provider_signals.style_provider_signals
    method as_style_provider : Style_provider.t
end

(* High-level class for StyleProvider *)
class style_provider (obj : Style_provider.t) : style_provider_t = object (self)
  inherit Gstyle_provider_signals.style_provider_signals obj

    method as_style_provider = obj
end

