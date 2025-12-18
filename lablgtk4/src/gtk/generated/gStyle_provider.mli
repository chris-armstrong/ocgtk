class style_provider : Style_provider.t ->
  object
    inherit Gstyle_provider_signals.style_provider_signals
    method as_style_provider : Style_provider.t
  end

