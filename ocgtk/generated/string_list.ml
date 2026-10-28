class type string_list_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t

  (** {2:methods Methods} *)

  method append : string -> unit
  (** Appends [string] to [self].

      The [string] will be copied. See [Gtk.StringList.take] for a way to avoid
      that. *)

  method find : string -> int
  (** Gets the position of the [string] in [self].

      If [self] does not contain [string] item, [G_MAXUINT] is returned. *)

  method get_string : int -> string option
  (** Gets the string that is at [position] in [self].

      If [self] does not contain [position] items, [None] is returned.

      This function returns the const char *. To get the object wrapping it, use
      g_list_model_get_item(). *)

  method remove : int -> unit
  (** Removes the string at [position] from [self].

      [position] must be smaller than the current length of the list. *)

  method splice : int -> int -> string array option -> unit
  (** Changes [self] by removing [n_removals] strings and adding [additions] to
      it.

      This function is more efficient than [Gtk.StringList.append] and
      [Gtk.StringList.remove], because it only emits the ::items-changed signal
      once for the change.

      This function copies the strings in [additions].

      The parameters [position] and [n_removals] must be correct (ie: [position]
      \+ [n_removals] must be less than or equal to the length of the list at
      the time this function is called). *)

  method take : string -> unit
  [@@ocaml.doc
    "Adds [string] to self at the end, and takes\n\
     ownership of it.\n\n\
     This variant of [Gtk.StringList.append]\n\
     is convenient for formatting strings:\n\n\
     {[\n\
     gtk_string_list_take (self, g_strdup_print (\"%d dollars\", lots));\n\
     ]}"]

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_string_list : Raw.String_list.t
end

(* High-level class for StringList *)
class string_list (obj : Raw.String_list.t) : string_list_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method append : string -> unit =
      fun string -> Raw.String_list.append obj string

    method find : string -> int = fun string -> Raw.String_list.find obj string

    method get_string : int -> string option =
      fun position -> Raw.String_list.get_string obj position

    method remove : int -> unit =
      fun position -> Raw.String_list.remove obj position

    method splice : int -> int -> string array option -> unit =
      fun position n_removals additions ->
        Raw.String_list.splice obj position n_removals additions

    method take : string -> unit = fun string -> Raw.String_list.take obj string
    method item_type = Raw.String_list.get_item_type obj
    method n_items = Raw.String_list.get_n_items obj
    method as_string_list = obj
  end

let new_ (strings : string array option) : string_list_t =
  let obj_ = Raw.String_list.new_ strings in
  new string_list obj_
