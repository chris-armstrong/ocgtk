(* High-level class for EmojiChooser *)
class emoji_chooser_skel (obj : Emoji_chooser.t) = object (self)
  inherit GObj.widget_impl (Emoji_chooser.as_widget obj)

end

class emoji_chooser obj = object
  inherit emoji_chooser_skel obj
end
