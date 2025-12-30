(* GENERATED CODE - DO NOT EDIT *)
(* Icon: Icon *)

type t = [`icon] Gobject.obj

(* Methods *)
(** Generates a textual representation of @icon that can be used for
serialization such as when passing @icon to a different process or
saving it to persistent storage. Use g_icon_new_for_string() to
get @icon back from the returned string.

The encoding of the returned string is proprietary to #GIcon except
in the following two cases

- If @icon is a #GFileIcon, the returned string is a native path
  (such as `/path/to/my icon.png`) without escaping
  if the #GFile for @icon is a native file.  If the file is not
  native, the returned string is the result of g_file_get_uri()
  (such as `sftp://path/to/my%20icon.png`).

- If @icon is a #GThemedIcon with exactly one name and no fallbacks,
  the encoding is simply the name (such as `network-server`). *)
external to_string : t -> string option = "ml_g_icon_to_string"

(** Gets a hash for an icon. *)
external hash : t -> int = "ml_g_icon_hash"

(** Checks if two icons are equal. *)
external equal : t -> t option -> bool = "ml_g_icon_equal"

