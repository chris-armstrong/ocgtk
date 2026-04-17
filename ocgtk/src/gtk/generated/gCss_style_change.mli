class type css_style_change_t = object
    method as_css_style_change : Css_style_change.t
end

class css_style_change : Css_style_change.t -> css_style_change_t

