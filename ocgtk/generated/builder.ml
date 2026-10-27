class type builder_t = object
  method add_from_file : string -> (bool, GError.t) result
  (** Parses a file containing a UI definition and merges it with the current
      contents of [builder].

      This function is useful if you need to call
      [Gtk.Builder.set_current_object]) to add user data to callbacks before
      loading GtkBuilder UI. Otherwise, you probably want
      [Gtk.Builder.new_from_file] instead.

      If an error occurs, 0 will be returned and [error] will be assigned a
      [GError] from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or [G_FILE_ERROR]
      domains.

      It’s not really reasonable to attempt to handle failures of this call. You
      should not use this function with untrusted files (ie: files that are not
      part of your application). Broken [GtkBuilder] files can easily crash your
      program, and it’s possible that memory was leaked leading up to the
      reported failure. The only reasonable thing to do when an error is
      detected is to call [g_error()]. *)

  method add_from_resource : string -> (bool, GError.t) result
  (** Parses a resource file containing a UI definition and merges it with the
      current contents of [builder].

      This function is useful if you need to call
      [Gtk.Builder.set_current_object] to add user data to callbacks before
      loading GtkBuilder UI. Otherwise, you probably want
      [Gtk.Builder.new_from_resource] instead.

      If an error occurs, 0 will be returned and [error] will be assigned a
      [GError] from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or
      [G_RESOURCE_ERROR] domain.

      It’s not really reasonable to attempt to handle failures of this call. The
      only reasonable thing to do when an error is detected is to call
      g_error(). *)

  method add_from_string : string -> int -> (bool, GError.t) result
  (** Parses a string containing a UI definition and merges it with the current
      contents of [builder].

      This function is useful if you need to call
      [Gtk.Builder.set_current_object] to add user data to callbacks before
      loading [GtkBuilder] UI. Otherwise, you probably want
      [Gtk.Builder.new_from_string] instead.

      Upon errors [FALSE] will be returned and [error] will be assigned a
      [GError] from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or
      [G_VARIANT_PARSE_ERROR] domain.

      It’s not really reasonable to attempt to handle failures of this call. The
      only reasonable thing to do when an error is detected is to call
      g_error(). *)

  method add_objects_from_file :
    string -> string array -> (bool, GError.t) result
  (** Parses a file containing a UI definition building only the requested
      objects and merges them with the current contents of [builder].

      Upon errors, 0 will be returned and [error] will be assigned a [GError]
      from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or [G_FILE_ERROR] domain.

      If you are adding an object that depends on an object that is not its
      child (for instance a [GtkTreeView] that depends on its [GtkTreeModel]),
      you have to explicitly list all of them in [object_ids]. *)

  method add_objects_from_resource :
    string -> string array -> (bool, GError.t) result
  (** Parses a resource file containing a UI definition, building only the
      requested objects and merges them with the current contents of [builder].

      Upon errors, 0 will be returned and [error] will be assigned a [GError]
      from the [GTK_BUILDER_ERROR], [G_MARKUP_ERROR] or [G_RESOURCE_ERROR]
      domain.

      If you are adding an object that depends on an object that is not its
      child (for instance a [GtkTreeView] that depends on its [GtkTreeModel]),
      you have to explicitly list all of them in [object_ids]. *)

  method add_objects_from_string :
    string -> int -> string array -> (bool, GError.t) result
  (** Parses a string containing a UI definition, building only the requested
      objects and merges them with the current contents of [builder].

      Upon errors [FALSE] will be returned and [error] will be assigned a
      [GError] from the [GTK_BUILDER_ERROR] or [G_MARKUP_ERROR] domain.

      If you are adding an object that depends on an object that is not its
      child (for instance a [GtkTreeView] that depends on its [GtkTreeModel]),
      you have to explicitly list all of them in [object_ids]. *)

  method expose_object : string -> [ `object_ ] Gobject.obj -> unit
  (** Add [object] to the [builder] object pool so it can be referenced just
      like any other object built by builder.

      Only a single object may be added using [name]. However, it is not an
      error to expose the same object under multiple names.
      [gtk_builder_get_object()] may be used to determine if an object has
      already been added with [name]. *)

  method extend_with_template :
    [ `object_ ] Gobject.obj ->
    Gobject.Type.t ->
    string ->
    int ->
    (bool, GError.t) result
  (** Main private entry point for building composite components from template
      XML.

      Most likely you do not need to call this function in applications as
      templates are handled by [GtkWidget]. *)

  method get_current_object : unit -> [ `object_ ] Gobject.obj option
  (** Gets the current object set via gtk_builder_set_current_object(). *)

  method get_object : string -> [ `object_ ] Gobject.obj option
  (** Gets the object named [name].

      Note that this function does not increment the reference count of the
      returned object. *)

  method get_objects : unit -> [ `object_ ] Gobject.obj list
  (** Gets all objects that have been constructed by [builder].

      Note that this function does not increment the reference counts of the
      returned objects. *)

  method get_scope : unit -> Builder_scope.builder_scope_t
  (** Gets the scope in use that was set via gtk_builder_set_scope(). *)

  method get_translation_domain : unit -> string option
  (** Gets the translation domain of [builder]. *)

  method get_type_from_name : string -> Gobject.Type.t
  (** Looks up a type by name.

      This is using the virtual function that [GtkBuilder] has for that purpose.
      This is mainly used when implementing the [GtkBuildable] interface on a
      type. *)

  method set_current_object : [ `object_ ] Gobject.obj option -> unit
  (** Sets the current object for the [builder].

      The current object can be thought of as the [this] object that the builder
      is working for and will often be used as the default object when an object
      is optional.

      [Gtk.Widget.init_template] for example will set the current object to the
      widget the template is inited for. For functions like
      [Gtk.Builder.new_from_resource], the current object will be [NULL]. *)

  method set_scope : Builder_scope.builder_scope_t option -> unit
  (** Sets the scope the builder should operate in.

      If [scope] is [NULL], a new [Gtk.BuilderCScope] will be created. *)

  method set_translation_domain : string option -> unit
  (** Sets the translation domain of [builder]. *)

  method as_builder : Raw.Builder.t
end

(* High-level class for Builder *)
class builder (obj : Raw.Builder.t) : builder_t =
  object (self)
    method add_from_file : string -> (bool, GError.t) result =
      fun filename -> Raw.Builder.add_from_file obj filename

    method add_from_resource : string -> (bool, GError.t) result =
      fun resource_path -> Raw.Builder.add_from_resource obj resource_path

    method add_from_string : string -> int -> (bool, GError.t) result =
      fun buffer length -> Raw.Builder.add_from_string obj buffer length

    method add_objects_from_file :
        string -> string array -> (bool, GError.t) result =
      fun filename object_ids ->
        Raw.Builder.add_objects_from_file obj filename object_ids

    method add_objects_from_resource :
        string -> string array -> (bool, GError.t) result =
      fun resource_path object_ids ->
        Raw.Builder.add_objects_from_resource obj resource_path object_ids

    method add_objects_from_string :
        string -> int -> string array -> (bool, GError.t) result =
      fun buffer length object_ids ->
        Raw.Builder.add_objects_from_string obj buffer length object_ids

    method expose_object : string -> [ `object_ ] Gobject.obj -> unit =
      fun name object_ -> Raw.Builder.expose_object obj name object_

    method extend_with_template :
        [ `object_ ] Gobject.obj ->
        Gobject.Type.t ->
        string ->
        int ->
        (bool, GError.t) result =
      fun object_ template_type buffer length ->
        Raw.Builder.extend_with_template obj object_ template_type buffer length

    method get_current_object : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Builder.get_current_object obj

    method get_object : string -> [ `object_ ] Gobject.obj option =
      fun name -> Raw.Builder.get_object obj name

    method get_objects : unit -> [ `object_ ] Gobject.obj list =
      fun () -> Raw.Builder.get_objects obj

    method get_scope : unit -> Builder_scope.builder_scope_t =
      fun () -> new Builder_scope.builder_scope (Raw.Builder.get_scope obj)

    method get_translation_domain : unit -> string option =
      fun () -> Raw.Builder.get_translation_domain obj

    method get_type_from_name : string -> Gobject.Type.t =
      fun type_name -> Raw.Builder.get_type_from_name obj type_name

    method set_current_object : [ `object_ ] Gobject.obj option -> unit =
      fun current_object -> Raw.Builder.set_current_object obj current_object

    method set_scope : Builder_scope.builder_scope_t option -> unit =
      fun scope ->
        let scope = Option.map (fun c -> c#as_builder_scope) scope in
        Raw.Builder.set_scope obj scope

    method set_translation_domain : string option -> unit =
      fun domain -> Raw.Builder.set_translation_domain obj domain

    method as_builder = obj
  end

let new_ () : builder_t = new builder (Raw.Builder.new_ ())

let new_from_file (filename : string) : builder_t =
  let obj_ = Raw.Builder.new_from_file filename in
  new builder obj_

let new_from_resource (resource_path : string) : builder_t =
  let obj_ = Raw.Builder.new_from_resource resource_path in
  new builder obj_

let new_from_string (string : string) (length : int) : builder_t =
  let obj_ = Raw.Builder.new_from_string string length in
  new builder obj_
