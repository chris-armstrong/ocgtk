class type icon_theme_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the icon theme changes.

      This can happen because current icon theme is switched or because GTK
      detects that a change has occurred in the contents of the current icon
      theme. *)

  method add_resource_path : string -> unit
  (** Adds a resource path that will be looked at when looking for icons,
      similar to search paths.

      See [Gtk.IconTheme.set_resource_path].

      This function should be used to make application-specific icons available
      as part of the icon theme. *)

  method add_search_path : string -> unit
  (** Appends a directory to the search path.

      See [Gtk.IconTheme.set_search_path]. *)

  method get_display : unit -> Ocgdk.Display.display_t option
  (** Returns the display that the [GtkIconTheme] object was created for. *)

  method get_icon_names : unit -> string array
  (** Lists the names of icons in the current icon theme. *)

  method get_resource_path : unit -> string array option
  (** Gets the current resource path.

      See [Gtk.IconTheme.set_resource_path]. *)

  method get_search_path : unit -> string array option
  (** Gets the current search path.

      See [Gtk.IconTheme.set_search_path]. *)

  method get_theme_name : unit -> string
  (** Gets the current icon theme name. *)

  method has_gicon : Ocgio.Icon.icon_t -> bool
  (** Checks whether an icon theme includes an icon for a particular [GIcon]. *)

  method has_icon : string -> bool
  (** Checks whether an icon theme includes an icon for a particular name. *)

  method lookup_by_gicon :
    Ocgio.Icon.icon_t ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t
  (** Looks up a icon for a desired size and window scale.

      The icon can then be rendered by using it as a [GdkPaintable], or you can
      get information such as the filename and size. *)

  method lookup_icon :
    string ->
    string array option ->
    int ->
    int ->
    Enums.textdirection ->
    Enums.iconlookupflags ->
    Icon_paintable.icon_paintable_t
  [@@ocaml.doc
    "Looks up a named icon for a desired size and window scale,\n\
     returning a [GtkIconPaintable].\n\n\
     The icon can then be rendered by using it as a [GdkPaintable],\n\
     or you can get information such as the filename and size.\n\n\
     If the available [icon_name] is not available and [fallbacks] are\n\
     provided, they will be tried in order.\n\n\
     If no matching icon is found, then a paintable that renders the\n\
     \"missing icon\" icon is returned. If you need to do something else\n\
     for missing icons you need to use [Gtk.IconTheme.has_icon].\n\n\
     Note that you probably want to listen for icon theme changes and\n\
     update the icon. This is usually done by overriding the\n\
     GtkWidgetClass.css-changed() function."]

  method set_resource_path : string array option -> unit
  (** Sets the resource paths that will be looked at when looking for icons,
      similar to search paths.

      The resources are considered as part of the hicolor icon theme and must be
      located in subdirectories that are defined in the hicolor icon theme, such
      as [@path/16x16/actions/run.png] or [@path/scalable/actions/run.svg].

      Icons that are directly placed in the resource path instead of a
      subdirectory are also considered as ultimate fallback, but they are
      treated like unthemed icons. *)

  method set_search_path : string array option -> unit
  (** Sets the search path for the icon theme object.

      When looking for an icon theme, GTK will search for a subdirectory of one
      or more of the directories in [path] with the same name as the icon theme
      containing an index.theme file. (Themes from multiple of the path elements
      are combined to allow themes to be extended by adding icons in the user’s
      home directory.)

      In addition if an icon found isn’t found either in the current icon theme
      or the default icon theme, and an image file with the right name is found
      directly in one of the elements of [path], then that image will be used
      for the icon name. (This is legacy feature, and new icons should be put
      into the fallback icon theme, which is called hicolor, rather than
      directly on the icon path.) *)

  method set_theme_name : string option -> unit
  (** Sets the name of the icon theme that the [GtkIconTheme] object uses
      overriding system configuration.

      This function cannot be called on the icon theme objects returned from
      [Gtk.IconTheme.get_for_display]. *)

  method as_icon_theme : Raw.Icon_theme.t
end

(* High-level class for IconTheme *)
class icon_theme (obj : Raw.Icon_theme.t) : icon_theme_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Icon_theme.on_changed ~after self#as_icon_theme ~callback

    method add_resource_path : string -> unit =
      fun path -> Raw.Icon_theme.add_resource_path obj path

    method add_search_path : string -> unit =
      fun path -> Raw.Icon_theme.add_search_path obj path

    method get_display : unit -> Ocgdk.Display.display_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Display.display ret)
          (Raw.Icon_theme.get_display obj)

    method get_icon_names : unit -> string array =
      fun () -> Raw.Icon_theme.get_icon_names obj

    method get_resource_path : unit -> string array option =
      fun () -> Raw.Icon_theme.get_resource_path obj

    method get_search_path : unit -> string array option =
      fun () -> Raw.Icon_theme.get_search_path obj

    method get_theme_name : unit -> string =
      fun () -> Raw.Icon_theme.get_theme_name obj

    method has_gicon : Ocgio.Icon.icon_t -> bool =
      fun gicon ->
        let gicon = gicon#as_icon in
        Raw.Icon_theme.has_gicon obj gicon

    method has_icon : string -> bool =
      fun icon_name -> Raw.Icon_theme.has_icon obj icon_name

    method lookup_by_gicon :
        Ocgio.Icon.icon_t ->
        int ->
        int ->
        Enums.textdirection ->
        Enums.iconlookupflags ->
        Icon_paintable.icon_paintable_t =
      fun icon size scale direction flags ->
        let icon = icon#as_icon in
        new Icon_paintable.icon_paintable
          (Raw.Icon_theme.lookup_by_gicon obj icon size scale direction flags)

    method lookup_icon :
        string ->
        string array option ->
        int ->
        int ->
        Enums.textdirection ->
        Enums.iconlookupflags ->
        Icon_paintable.icon_paintable_t =
      fun icon_name fallbacks size scale direction flags ->
        new Icon_paintable.icon_paintable
          (Raw.Icon_theme.lookup_icon obj icon_name fallbacks size scale
             direction flags)

    method set_resource_path : string array option -> unit =
      fun path -> Raw.Icon_theme.set_resource_path obj path

    method set_search_path : string array option -> unit =
      fun path -> Raw.Icon_theme.set_search_path obj path

    method set_theme_name : string option -> unit =
      fun theme_name -> Raw.Icon_theme.set_theme_name obj theme_name

    method as_icon_theme = obj
  end

let new_ () : icon_theme_t = new icon_theme (Raw.Icon_theme.new_ ())
