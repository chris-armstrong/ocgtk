(** Used to create and destroy cursors.

    Its methods, signals and properties are on {!class-type-cursor_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Cursor}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Cursor].}

    Used to create and destroy cursors.

    Cursors are immutable objects, so once you created them, there is no way to
    modify them later. You should create a new cursor when you want to change
    something about it.

    Cursors by themselves are not very interesting: they must be bound to a
    window for users to see them. This is done with [Gdk.Surface.set_cursor] or
    [Gdk.Surface.set_device_cursor]. Applications will typically use
    higher-level GTK functions such as gtk_widget_set_cursor() instead.

    Cursors are not bound to a given [Gdk.Display], so they can be shared.
    However, the appearance of cursors may vary when used on different
    platforms.

    {b Named and texture cursors}

    There are multiple ways to create cursors. The platform's own cursors can be
    created with [Gdk.Cursor.new_from_name]. That function lists the commonly
    available names that are shared with the CSS specification. Other names may
    be available, depending on the platform in use. On some platforms, what
    images are used for named cursors may be influenced by the cursor theme.

    Another option to create a cursor is to use [Gdk.Cursor.new_from_texture]
    and provide an image to use for the cursor.

    To ease work with unsupported cursors, a fallback cursor can be provided. If
    a [Gdk.Surface] cannot use a cursor because of the reasons mentioned above,
    it will try the fallback cursor. Fallback cursors can themselves have
    fallback cursors again, so it is possible to provide a chain of
    progressively easier to support cursors. If none of the provided cursors can
    be supported, the default cursor will be the ultimate fallback. *)
class type cursor_t = object
  (** {2:methods Methods} *)

  method get_fallback : unit -> cursor_t option
  (** Returns the fallback for this [cursor].

      The fallback will be used if this cursor is not available on a given
      [GdkDisplay]. For named cursors, this can happen when using nonstandard
      names or when using an incomplete cursor theme. For textured cursors, this
      can happen when the texture is too large or when the [GdkDisplay] it is
      used on does not support textured cursors. *)

  method get_hotspot_x : unit -> int
  (** Returns the horizontal offset of the hotspot.

      The hotspot indicates the pixel that will be directly above the cursor.

      Note that named cursors may have a nonzero hotspot, but this function will
      only return the hotspot position for cursors created with
      [Gdk.Cursor.new_from_texture]. *)

  method get_hotspot_y : unit -> int
  (** Returns the vertical offset of the hotspot.

      The hotspot indicates the pixel that will be directly above the cursor.

      Note that named cursors may have a nonzero hotspot, but this function will
      only return the hotspot position for cursors created with
      [Gdk.Cursor.new_from_texture]. *)

  method get_name : unit -> string option
  (** Returns the name of the cursor.

      If the cursor is not a named cursor, [NULL] will be returned. *)

  method get_texture : unit -> Texture.texture_t option
  (** Returns the texture for the cursor.

      If the cursor is a named cursor, [NULL] will be returned. *)

  (** {2:conversions Conversions} *)

  method as_cursor : Raw.Cursor.t
end

class cursor : Raw.Cursor.t -> cursor_t
(** Wraps a raw handle of {!Ocgdk.Raw.Cursor.t}. *)

(** {1:description Description}

    Used to create and destroy cursors.

    Cursors are immutable objects, so once you created them, there is no way to
    modify them later. You should create a new cursor when you want to change
    something about it.

    Cursors by themselves are not very interesting: they must be bound to a
    window for users to see them. This is done with [Gdk.Surface.set_cursor] or
    [Gdk.Surface.set_device_cursor]. Applications will typically use
    higher-level GTK functions such as gtk_widget_set_cursor() instead.

    Cursors are not bound to a given [Gdk.Display], so they can be shared.
    However, the appearance of cursors may vary when used on different
    platforms.

    {b Named and texture cursors}

    There are multiple ways to create cursors. The platform's own cursors can be
    created with [Gdk.Cursor.new_from_name]. That function lists the commonly
    available names that are shared with the CSS specification. Other names may
    be available, depending on the platform in use. On some platforms, what
    images are used for named cursors may be influenced by the cursor theme.

    Another option to create a cursor is to use [Gdk.Cursor.new_from_texture]
    and provide an image to use for the cursor.

    To ease work with unsupported cursors, a fallback cursor can be provided. If
    a [Gdk.Surface] cannot use a cursor because of the reasons mentioned above,
    it will try the fallback cursor. Fallback cursors can themselves have
    fallback cursors again, so it is possible to provide a chain of
    progressively easier to support cursors. If none of the provided cursors can
    be supported, the default cursor will be the ultimate fallback. *)

(** {1:constructors Constructors} *)

val new_from_name : string -> cursor_t option -> cursor_t
(** Creates a new cursor by looking up [name] in the current cursor theme.

    A recommended set of cursor names that will work across different platforms
    can be found in the CSS specification: *)

val new_from_texture :
  Texture.texture_t -> int -> int -> cursor_t option -> cursor_t
(** Creates a new cursor from a [GdkTexture]. *)
