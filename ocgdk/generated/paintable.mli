(** An interface for content that can be painted.

    The content of a [GdkPaintable] can be painted anywhere at any size without
    requiring any sort of layout. The interface is inspired by similar concepts
    elsewhere, such as
    {{:https://developer.gnome.org/clutter/stable/ClutterContent.html}ClutterContent},
    {{:https://www.w3.org/TR/css-images-4/#paint-source}HTML/CSS Paint Sources},
    or {{:https://www.w3.org/TR/SVG2/pservers.html}SVG Paint Servers}.

    A [GdkPaintable] can be snapshot at any time and size using
    [Gdk.Paintable.snapshot]. How the paintable interprets that size and if it
    scales or centers itself into the given rectangle is implementation defined,
    though if you are implementing a [GdkPaintable] and don't know what to do,
    it is suggested that you scale your paintable ignoring any potential aspect
    ratio.

    The contents that a [GdkPaintable] produces may depend on the [Gdk.Snapshot]
    passed to it. For example, paintables may decide to use more detailed images
    on higher resolution screens or when OpenGL is available. A [GdkPaintable]
    will however always produce the same output for the same snapshot.

    A [GdkPaintable] may change its contents, meaning that it will now produce a
    different output with the same snapshot. Once that happens, it will call
    [Gdk.Paintable.invalidate_contents] which will emit the
    [Gdk.Paintable::invalidate-contents] signal. If a paintable is known to
    never change its contents, it will set the [GDK_PAINTABLE_STATIC_CONTENTS]
    flag. If a consumer cannot deal with changing contents, it may call
    [Gdk.Paintable.get_current_image] which will return a static paintable and
    use that.

    A paintable can report an intrinsic (or preferred) size or aspect ratio it
    wishes to be rendered at, though it doesn't have to. Consumers of the
    interface can use this information to layout thepaintable appropriately.
    Just like the contents, the size of a paintable can change. A paintable will
    indicate this by calling [Gdk.Paintable.invalidate_size] which will emit the
    [Gdk.Paintable::invalidate-size] signal. And just like for contents, if a
    paintable is known to never change its size, it will set the
    [GDK_PAINTABLE_STATIC_SIZE] flag.

    Besides API for applications, there are some functions that are only useful
    for implementing subclasses and should not be used by applications:
    [Gdk.Paintable.invalidate_contents], [Gdk.Paintable.invalidate_size],
    [Gdk.Paintable.new_empty].

    Its methods, signals and properties are on {!class-type-paintable_t}. The
    functions it is built on are in {!Ocgdk.Raw.Paintable}. *)

(** The methods, signals and properties of a [GdkPaintable]. *)
class type paintable_t = object
  method on_invalidate_contents :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the contents of the [paintable] change.

      Examples for such an event would be videos changing to the next frame or
      the icon theme for an icon changing. *)

  method on_invalidate_size :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the intrinsic size of the [paintable] changes.

      This means the values reported by at least one of
      [Gdk.Paintable.get_intrinsic_width], [Gdk.Paintable.get_intrinsic_height]
      or [Gdk.Paintable.get_intrinsic_aspect_ratio] has changed.

      Examples for such an event would be a paintable displaying the contents of
      a toplevel surface being resized. *)

  method get_current_image : unit -> paintable_t
  (** Gets an immutable paintable for the current contents displayed by
      [paintable].

      This is useful when you want to retain the current state of an animation,
      for example to take a screenshot of a running animation.

      If the [paintable] is already immutable, it will return itself. *)

  method get_flags : unit -> Enums.paintableflags
  (** Get flags for the paintable.

      This is oftentimes useful for optimizations.

      See [Gdk.PaintableFlags] for the flags and what they mean. *)

  method get_intrinsic_aspect_ratio : unit -> float
  (** Gets the preferred aspect ratio the [paintable] would like to be displayed
      at.

      The aspect ratio is the width divided by the height, so a value of 0.5
      means that the [paintable] prefers to be displayed twice as high as it is
      wide. Consumers of this interface can use this to preserve aspect ratio
      when displaying the paintable.

      This is a purely informational value and does not in any way limit the
      values that may be passed to [Gdk.Paintable.snapshot].

      Usually when a [paintable] returns nonzero values from
      [Gdk.Paintable.get_intrinsic_width] and
      [Gdk.Paintable.get_intrinsic_height] the aspect ratio should conform to
      those values, though that is not required.

      If the [paintable] does not have a preferred aspect ratio, it returns 0.
      Negative values are never returned. *)

  method get_intrinsic_height : unit -> int
  (** Gets the preferred height the [paintable] would like to be displayed at.

      Consumers of this interface can use this to reserve enough space to draw
      the paintable.

      This is a purely informational value and does not in any way limit the
      values that may be passed to [Gdk.Paintable.snapshot].

      If the [paintable] does not have a preferred height, it returns 0.
      Negative values are never returned. *)

  method get_intrinsic_width : unit -> int
  (** Gets the preferred width the [paintable] would like to be displayed at.

      Consumers of this interface can use this to reserve enough space to draw
      the paintable.

      This is a purely informational value and does not in any way limit the
      values that may be passed to [Gdk.Paintable.snapshot].

      If the [paintable] does not have a preferred width, it returns 0. Negative
      values are never returned. *)

  method invalidate_contents : unit -> unit
  (** Called by implementations of [GdkPaintable] to invalidate their contents.

      Unless the contents are invalidated, implementations must guarantee that
      multiple calls of [Gdk.Paintable.snapshot] produce the same output.

      This function will emit the [Gdk.Paintable::invalidate-contents] signal.

      If a [paintable] reports the [GDK_PAINTABLE_STATIC_CONTENTS] flag, it must
      not call this function. *)

  method invalidate_size : unit -> unit
  (** Called by implementations of [GdkPaintable] to invalidate their size.

      As long as the size is not invalidated, [paintable] must return the same
      values for its intrinsic width, height and aspect ratio.

      This function will emit the [Gdk.Paintable::invalidate-size] signal.

      If a [paintable] reports the [GDK_PAINTABLE_STATIC_SIZE] flag, it must not
      call this function. *)

  method snapshot : Snapshot.snapshot_t -> float -> float -> unit
  (** Snapshots the given paintable with the given [width] and [height].

      The paintable is drawn at the current (0,0) offset of the [snapshot]. If
      [width] and [height] are not larger than zero, this function will do
      nothing. *)

  method as_paintable : Raw.Paintable.t
end

class paintable : Raw.Paintable.t -> paintable_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Paintable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkPaintable], give one already wrapped. *)
