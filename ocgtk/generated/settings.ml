class type settings_t = object
  inherit Style_provider.style_provider_t

  (** {2:methods Methods} *)

  method reset_property : string -> unit
  (** Undoes the effect of calling g_object_set() to install an
      application-specific value for a setting.

      After this call, the setting will again follow the session-wide value for
      this setting. *)

  (** {2:properties Properties} *)

  method gtk_alternative_button_order : bool
  (** Whether buttons in dialogs should use the alternative button order. *)

  method set_gtk_alternative_button_order : bool -> unit
  (** Whether buttons in dialogs should use the alternative button order. *)

  method gtk_alternative_sort_arrows : bool
  (** Controls the direction of the sort indicators in sorted list and tree
      views.

      By default an arrow pointing down means the column is sorted in ascending
      order. When set to [true], this order will be inverted. *)

  method set_gtk_alternative_sort_arrows : bool -> unit
  (** Controls the direction of the sort indicators in sorted list and tree
      views.

      By default an arrow pointing down means the column is sorted in ascending
      order. When set to [true], this order will be inverted. *)

  method gtk_application_prefer_dark_theme : bool
  (** Whether the application prefers to use a dark theme.

      If a GTK theme includes a dark variant, it will be used instead of the
      configured theme.

      Some applications benefit from minimizing the amount of light pollution
      that interferes with the content. Good candidates for dark themes are
      photo and video editors that make the actual content get all the attention
      and minimize the distraction of the chrome.

      Dark themes should not be used for documents, where large spaces are
      white/light and the dark chrome creates too much contrast (web browser,
      text editor...). *)

  method set_gtk_application_prefer_dark_theme : bool -> unit
  (** Whether the application prefers to use a dark theme.

      If a GTK theme includes a dark variant, it will be used instead of the
      configured theme.

      Some applications benefit from minimizing the amount of light pollution
      that interferes with the content. Good candidates for dark themes are
      photo and video editors that make the actual content get all the attention
      and minimize the distraction of the chrome.

      Dark themes should not be used for documents, where large spaces are
      white/light and the dark chrome creates too much contrast (web browser,
      text editor...). *)

  method gtk_cursor_aspect_ratio : float
  (** The aspect ratio of the text caret. *)

  method set_gtk_cursor_aspect_ratio : float -> unit
  (** The aspect ratio of the text caret. *)

  method gtk_cursor_blink : bool
  (** Whether the cursor should blink.

      Also see the [Gtk.Settings:gtk-cursor-blink-timeout] setting, which allows
      more flexible control over cursor blinking. *)

  method set_gtk_cursor_blink : bool -> unit
  (** Whether the cursor should blink.

      Also see the [Gtk.Settings:gtk-cursor-blink-timeout] setting, which allows
      more flexible control over cursor blinking. *)

  method gtk_cursor_blink_time : int
  (** Length of the cursor blink cycle, in milliseconds. *)

  method set_gtk_cursor_blink_time : int -> unit
  (** Length of the cursor blink cycle, in milliseconds. *)

  method gtk_cursor_blink_timeout : int
  (** Time after which the cursor stops blinking, in seconds.

      The timer is reset after each user interaction.

      Setting this to zero has the same effect as setting
      [Gtk.Settings:gtk-cursor-blink] to [false]. *)

  method set_gtk_cursor_blink_timeout : int -> unit
  (** Time after which the cursor stops blinking, in seconds.

      The timer is reset after each user interaction.

      Setting this to zero has the same effect as setting
      [Gtk.Settings:gtk-cursor-blink] to [false]. *)

  method gtk_cursor_theme_name : string
  (** Name of the cursor theme to use.

      Use [None] to use the default theme. *)

  method set_gtk_cursor_theme_name : string -> unit
  (** Name of the cursor theme to use.

      Use [None] to use the default theme. *)

  method gtk_cursor_theme_size : int
  (** The size to use for cursors.

      0 means to use the default size. *)

  method set_gtk_cursor_theme_size : int -> unit
  (** The size to use for cursors.

      0 means to use the default size. *)

  method gtk_decoration_layout : string
  [@@ocaml.doc
    "Determines which buttons should be put in the\n\
     titlebar of client-side decorated windows, and whether they\n\
     should be placed on the left or right.\n\n\
     The format of the string is button names, separated by commas.\n\
     A colon separates the buttons that should appear on the left\n\
     from those on the right. Recognized button names are minimize,\n\
     maximize, close, icon (the window icon) and menu (a menu button\n\
     for the fallback app menu).\n\n\
     For example, \"menu:minimize,maximize,close\" specifies a menu\n\
     on the left, and minimize, maximize and close buttons on the right.\n\n\
     Note that buttons will only be shown when they are meaningful.\n\
     E.g. a menu button only appears when the desktop shell does not\n\
     show the app menu, and a close button only appears on a window\n\
     that can be closed.\n\n\
     Also note that the setting can be overridden with the\n\
     [Gtk.HeaderBar:decoration-layout] property."]

  method set_gtk_decoration_layout : string -> unit
  [@@ocaml.doc
    "Determines which buttons should be put in the\n\
     titlebar of client-side decorated windows, and whether they\n\
     should be placed on the left or right.\n\n\
     The format of the string is button names, separated by commas.\n\
     A colon separates the buttons that should appear on the left\n\
     from those on the right. Recognized button names are minimize,\n\
     maximize, close, icon (the window icon) and menu (a menu button\n\
     for the fallback app menu).\n\n\
     For example, \"menu:minimize,maximize,close\" specifies a menu\n\
     on the left, and minimize, maximize and close buttons on the right.\n\n\
     Note that buttons will only be shown when they are meaningful.\n\
     E.g. a menu button only appears when the desktop shell does not\n\
     show the app menu, and a close button only appears on a window\n\
     that can be closed.\n\n\
     Also note that the setting can be overridden with the\n\
     [Gtk.HeaderBar:decoration-layout] property."]

  method gtk_dialogs_use_header : bool
  (** Whether builtin GTK dialogs such as the file chooser, the color chooser or
      the font chooser will use a header bar at the top to show action widgets,
      or an action area at the bottom.

      This setting does not affect custom dialogs using [GtkDialog] directly, or
      message dialogs. *)

  method set_gtk_dialogs_use_header : bool -> unit
  (** Whether builtin GTK dialogs such as the file chooser, the color chooser or
      the font chooser will use a header bar at the top to show action widgets,
      or an action area at the bottom.

      This setting does not affect custom dialogs using [GtkDialog] directly, or
      message dialogs. *)

  method gtk_dnd_drag_threshold : int
  (** The number of pixels the cursor can move before dragging. *)

  method set_gtk_dnd_drag_threshold : int -> unit
  (** The number of pixels the cursor can move before dragging. *)

  method gtk_double_click_distance : int
  (** The maximum distance allowed between two clicks for them to be considered
      a double click, in pixels. *)

  method set_gtk_double_click_distance : int -> unit
  (** The maximum distance allowed between two clicks for them to be considered
      a double click, in pixels. *)

  method gtk_double_click_time : int
  (** The maximum time to allow between two clicks for them to be considered a
      double click, in milliseconds. *)

  method set_gtk_double_click_time : int -> unit
  (** The maximum time to allow between two clicks for them to be considered a
      double click, in milliseconds. *)

  method gtk_enable_accels : bool
  (** Whether menu items should have visible accelerators which can be
      activated. *)

  method set_gtk_enable_accels : bool -> unit
  (** Whether menu items should have visible accelerators which can be
      activated. *)

  method gtk_enable_animations : bool
  (** Whether to enable toolkit-wide animations. *)

  method set_gtk_enable_animations : bool -> unit
  (** Whether to enable toolkit-wide animations. *)

  method gtk_enable_event_sounds : bool
  (** Whether to play any event sounds at all.

      See the Sound Theme Specifications for more information on event sounds
      and sound themes.

      GTK itself does not support event sounds, you have to use a loadable
      module like the one that comes with libcanberra. *)

  method set_gtk_enable_event_sounds : bool -> unit
  (** Whether to play any event sounds at all.

      See the Sound Theme Specifications for more information on event sounds
      and sound themes.

      GTK itself does not support event sounds, you have to use a loadable
      module like the one that comes with libcanberra. *)

  method gtk_enable_input_feedback_sounds : bool
  (** Whether to play event sounds as feedback to user input.

      See the Sound Theme Specifications for more information on event sounds
      and sound themes.

      GTK itself does not support event sounds, you have to use a loadable
      module like the one that comes with libcanberra. *)

  method set_gtk_enable_input_feedback_sounds : bool -> unit
  (** Whether to play event sounds as feedback to user input.

      See the Sound Theme Specifications for more information on event sounds
      and sound themes.

      GTK itself does not support event sounds, you have to use a loadable
      module like the one that comes with libcanberra. *)

  method gtk_enable_primary_paste : bool
  (** Whether a middle click on a mouse should paste the 'PRIMARY' clipboard
      content at the cursor location. *)

  method set_gtk_enable_primary_paste : bool -> unit
  (** Whether a middle click on a mouse should paste the 'PRIMARY' clipboard
      content at the cursor location. *)

  method gtk_entry_password_hint_timeout : int
  (** How long to show the last input character in hidden entries.

      This value is in milliseconds. 0 disables showing the last char. 600 is a
      good value for enabling it. *)

  method set_gtk_entry_password_hint_timeout : int -> unit
  (** How long to show the last input character in hidden entries.

      This value is in milliseconds. 0 disables showing the last char. 600 is a
      good value for enabling it. *)

  method gtk_entry_select_on_focus : bool
  (** Whether to select the contents of an entry when it is focused. *)

  method set_gtk_entry_select_on_focus : bool -> unit
  (** Whether to select the contents of an entry when it is focused. *)

  method gtk_error_bell : bool
  (** When [true], keyboard navigation and other input-related errors will cause
      a beep.

      Since the error bell is implemented using gdk_surface_beep(), the
      windowing system may offer ways to configure the error bell in many ways,
      such as flashing the window or similar visual effects. *)

  method set_gtk_error_bell : bool -> unit
  (** When [true], keyboard navigation and other input-related errors will cause
      a beep.

      Since the error bell is implemented using gdk_surface_beep(), the
      windowing system may offer ways to configure the error bell in many ways,
      such as flashing the window or similar visual effects. *)

  method gtk_font_name : string
  (** The default font to use.

      GTK uses the family name and size from this string. *)

  method set_gtk_font_name : string -> unit
  (** The default font to use.

      GTK uses the family name and size from this string. *)

  method gtk_font_rendering : Enums.fontrendering
  (** How GTK font rendering is set up.

      When set to [Gtk.FontRendering.MANUAL], GTK respects the low-level
      font-related settings ([Gtk.Settings:gtk-hint-font-metrics],
      [Gtk.Settings:gtk-xft-antialias], [Gtk.Settings:gtk-xft-hinting],
      [Gtk.Settings:gtk-xft-hintstyle] and [Gtk.Settings:gtk-xft-rgba]) as much
      as practical.

      When set to [Gtk.FontRendering.AUTOMATIC], GTK will consider factors such
      as screen resolution and scale in deciding how to render fonts. *)

  method set_gtk_font_rendering : Enums.fontrendering -> unit
  (** How GTK font rendering is set up.

      When set to [Gtk.FontRendering.MANUAL], GTK respects the low-level
      font-related settings ([Gtk.Settings:gtk-hint-font-metrics],
      [Gtk.Settings:gtk-xft-antialias], [Gtk.Settings:gtk-xft-hinting],
      [Gtk.Settings:gtk-xft-hintstyle] and [Gtk.Settings:gtk-xft-rgba]) as much
      as practical.

      When set to [Gtk.FontRendering.AUTOMATIC], GTK will consider factors such
      as screen resolution and scale in deciding how to render fonts. *)

  method gtk_fontconfig_timestamp : int
  (** Timestamp of the current fontconfig configuration. *)

  method set_gtk_fontconfig_timestamp : int -> unit
  (** Timestamp of the current fontconfig configuration. *)

  method gtk_hint_font_metrics : bool
  (** Whether hinting should be applied to font metrics.

      Note that this also turns off subpixel positioning of glyphs, since it
      conflicts with metrics hinting. *)

  method set_gtk_hint_font_metrics : bool -> unit
  (** Whether hinting should be applied to font metrics.

      Note that this also turns off subpixel positioning of glyphs, since it
      conflicts with metrics hinting. *)

  method gtk_icon_theme_name : string
  (** Name of the icon theme to use.

      See [Gtk.IconTheme] for details about how GTK handles icon themes. *)

  method set_gtk_icon_theme_name : string -> unit
  (** Name of the icon theme to use.

      See [Gtk.IconTheme] for details about how GTK handles icon themes. *)

  method gtk_im_module : string
  (** Which IM (input method) module should be used by default.

      This is the input method that will be used if the user has not explicitly
      chosen another input method from the IM context menu. This also can be a
      colon-separated list of input methods, which GTK will try in turn until it
      finds one available on the system.

      See [Gtk.IMContext]. *)

  method set_gtk_im_module : string -> unit
  (** Which IM (input method) module should be used by default.

      This is the input method that will be used if the user has not explicitly
      chosen another input method from the IM context menu. This also can be a
      colon-separated list of input methods, which GTK will try in turn until it
      finds one available on the system.

      See [Gtk.IMContext]. *)

  method gtk_interface_color_scheme : Enums.interfacecolorscheme
  (** The color scheme used for rendering the user interface.

      This setting communicates the system-wide preference. The color scheme
      that is actually used when applying CSS styles can be set with the
      [Gtk.CssProvider:prefers-color-scheme] property. *)

  method set_gtk_interface_color_scheme : Enums.interfacecolorscheme -> unit
  (** The color scheme used for rendering the user interface.

      This setting communicates the system-wide preference. The color scheme
      that is actually used when applying CSS styles can be set with the
      [Gtk.CssProvider:prefers-color-scheme] property. *)

  method gtk_interface_contrast : Enums.interfacecontrast
  (** The level of contrast to use for the user interface.

      This setting communicates the system-wide preference. The contrast level
      that is actually used when applying CSS styles can be set with the
      [Gtk.CssProvider:prefers-contrast] property. *)

  method set_gtk_interface_contrast : Enums.interfacecontrast -> unit
  (** The level of contrast to use for the user interface.

      This setting communicates the system-wide preference. The contrast level
      that is actually used when applying CSS styles can be set with the
      [Gtk.CssProvider:prefers-contrast] property. *)

  method gtk_keynav_use_caret : bool
  (** Whether GTK should make sure that text can be navigated with a caret, even
      if it is not editable.

      This is useful when using a screen reader. *)

  method set_gtk_keynav_use_caret : bool -> unit
  (** Whether GTK should make sure that text can be navigated with a caret, even
      if it is not editable.

      This is useful when using a screen reader. *)

  method gtk_label_select_on_focus : bool
  (** Whether to select the contents of a selectable label when it is focused.
  *)

  method set_gtk_label_select_on_focus : bool -> unit
  (** Whether to select the contents of a selectable label when it is focused.
  *)

  method gtk_long_press_time : int
  (** The time for a button or touch press to be considered a “long press”.

      See [Gtk.GestureLongPress]. *)

  method set_gtk_long_press_time : int -> unit
  (** The time for a button or touch press to be considered a “long press”.

      See [Gtk.GestureLongPress]. *)

  method gtk_overlay_scrolling : bool
  (** Whether scrolled windows may use overlaid scrolling indicators.

      If this is set to [false], scrolled windows will have permanent
      scrollbars. *)

  method set_gtk_overlay_scrolling : bool -> unit
  (** Whether scrolled windows may use overlaid scrolling indicators.

      If this is set to [false], scrolled windows will have permanent
      scrollbars. *)

  method gtk_primary_button_warps_slider : bool
  (** If the value of this setting is [true], clicking the primary button in a
      [GtkRange] trough will move the slider, and hence set the range’s value,
      to the point that you clicked.

      If it is [false], a primary click will cause the slider/value to move by
      the range’s page-size towards the point clicked.

      Whichever action you choose for the primary button, the other action will
      be available by holding Shift and primary-clicking, or clicking the middle
      mouse button. *)

  method set_gtk_primary_button_warps_slider : bool -> unit
  (** If the value of this setting is [true], clicking the primary button in a
      [GtkRange] trough will move the slider, and hence set the range’s value,
      to the point that you clicked.

      If it is [false], a primary click will cause the slider/value to move by
      the range’s page-size towards the point clicked.

      Whichever action you choose for the primary button, the other action will
      be available by holding Shift and primary-clicking, or clicking the middle
      mouse button. *)

  method gtk_print_backends : string
  [@@ocaml.doc
    "A comma-separated list of print backends to use in the print\n\
     dialog.\n\n\
     Available print backends depend on the GTK installation,\n\
     and may include \"file\", \"cups\", \"lpr\" or \"papi\"."]

  method set_gtk_print_backends : string -> unit
  [@@ocaml.doc
    "A comma-separated list of print backends to use in the print\n\
     dialog.\n\n\
     Available print backends depend on the GTK installation,\n\
     and may include \"file\", \"cups\", \"lpr\" or \"papi\"."]

  method gtk_print_preview_command : string
  (** A command to run for displaying the print preview.

      The command should contain a [%f] placeholder, which will get replaced by
      the path to the pdf file. The command may also contain a [%s] placeholder,
      which will get replaced by the path to a file containing the print
      settings in the format produced by [Gtk.PrintSettings.to_file].

      The preview application is responsible for removing the pdf file and the
      print settings file when it is done. *)

  method set_gtk_print_preview_command : string -> unit
  (** A command to run for displaying the print preview.

      The command should contain a [%f] placeholder, which will get replaced by
      the path to the pdf file. The command may also contain a [%s] placeholder,
      which will get replaced by the path to a file containing the print
      settings in the format produced by [Gtk.PrintSettings.to_file].

      The preview application is responsible for removing the pdf file and the
      print settings file when it is done. *)

  method gtk_recent_files_enabled : bool
  (** Whether GTK should keep track of items inside the recently used resources
      list.

      If set to [false], the list will always be empty. *)

  method set_gtk_recent_files_enabled : bool -> unit
  (** Whether GTK should keep track of items inside the recently used resources
      list.

      If set to [false], the list will always be empty. *)

  method gtk_recent_files_max_age : int
  (** The maximum age, in days, of the items inside the recently used resources
      list.

      Items older than this setting will be excised from the list. If set to 0,
      the list will always be empty; if set to -1, no item will be removed. *)

  method set_gtk_recent_files_max_age : int -> unit
  (** The maximum age, in days, of the items inside the recently used resources
      list.

      Items older than this setting will be excised from the list. If set to 0,
      the list will always be empty; if set to -1, no item will be removed. *)

  method gtk_shell_shows_app_menu : bool
  (** Set to [true] if the desktop environment is displaying the app menu,
      [false] if the app should display it itself. *)

  method set_gtk_shell_shows_app_menu : bool -> unit
  (** Set to [true] if the desktop environment is displaying the app menu,
      [false] if the app should display it itself. *)

  method gtk_shell_shows_desktop : bool
  (** Set to [true] if the desktop environment is displaying the desktop folder,
      [false] if not. *)

  method set_gtk_shell_shows_desktop : bool -> unit
  (** Set to [true] if the desktop environment is displaying the desktop folder,
      [false] if not. *)

  method gtk_shell_shows_menubar : bool
  (** Set to [true] if the desktop environment is displaying the menubar,
      [false] if the app should display it itself. *)

  method set_gtk_shell_shows_menubar : bool -> unit
  (** Set to [true] if the desktop environment is displaying the menubar,
      [false] if the app should display it itself. *)

  method gtk_show_status_shapes : bool
  (** When [true], widgets like switches include shapes to indicate their on/off
      state. *)

  method set_gtk_show_status_shapes : bool -> unit
  (** When [true], widgets like switches include shapes to indicate their on/off
      state. *)

  method gtk_sound_theme_name : string
  (** The XDG sound theme to use for event sounds.

      See the Sound Theme Specifications for more information on event sounds
      and sound themes.

      GTK itself does not support event sounds, you have to use a loadable
      module like the one that comes with libcanberra. *)

  method set_gtk_sound_theme_name : string -> unit
  (** The XDG sound theme to use for event sounds.

      See the Sound Theme Specifications for more information on event sounds
      and sound themes.

      GTK itself does not support event sounds, you have to use a loadable
      module like the one that comes with libcanberra. *)

  method gtk_split_cursor : bool
  (** Whether two cursors should be displayed for mixed left-to-right and
      right-to-left text. *)

  method set_gtk_split_cursor : bool -> unit
  (** Whether two cursors should be displayed for mixed left-to-right and
      right-to-left text. *)

  method gtk_theme_name : string
  (** Name of the theme to load.

      See [Gtk.CssProvider] for details about how GTK finds the CSS stylesheet
      for a theme. *)

  method set_gtk_theme_name : string -> unit
  (** Name of the theme to load.

      See [Gtk.CssProvider] for details about how GTK finds the CSS stylesheet
      for a theme. *)

  method gtk_titlebar_double_click : string
  (** Determines the action to take when a double-click occurs on the titlebar
      of client-side decorated windows.

      Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

  method set_gtk_titlebar_double_click : string -> unit
  (** Determines the action to take when a double-click occurs on the titlebar
      of client-side decorated windows.

      Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

  method gtk_titlebar_middle_click : string
  (** Determines the action to take when a middle-click occurs on the titlebar
      of client-side decorated windows.

      Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

  method set_gtk_titlebar_middle_click : string -> unit
  (** Determines the action to take when a middle-click occurs on the titlebar
      of client-side decorated windows.

      Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

  method gtk_titlebar_right_click : string
  (** Determines the action to take when a right-click occurs on the titlebar of
      client-side decorated windows.

      Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

  method set_gtk_titlebar_right_click : string -> unit
  (** Determines the action to take when a right-click occurs on the titlebar of
      client-side decorated windows.

      Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

  method gtk_xft_antialias : int
  (** Whether to antialias fonts.

      The values are 0 for no, 1 for yes, or -1 for the system default. *)

  method set_gtk_xft_antialias : int -> unit
  (** Whether to antialias fonts.

      The values are 0 for no, 1 for yes, or -1 for the system default. *)

  method gtk_xft_dpi : int
  (** The font resolution, in 1024 * dots/inch.

      -1 to use the default value. *)

  method set_gtk_xft_dpi : int -> unit
  (** The font resolution, in 1024 * dots/inch.

      -1 to use the default value. *)

  method gtk_xft_hinting : int
  (** Whether to enable font hinting.

      The values are 0 for no, 1 for yes, or -1 for the system default. *)

  method set_gtk_xft_hinting : int -> unit
  (** Whether to enable font hinting.

      The values are 0 for no, 1 for yes, or -1 for the system default. *)

  method gtk_xft_hintstyle : string
  (** What degree of font hinting to use.

      The possible vaues are hintnone, hintslight, hintmedium, hintfull. *)

  method set_gtk_xft_hintstyle : string -> unit
  (** What degree of font hinting to use.

      The possible vaues are hintnone, hintslight, hintmedium, hintfull. *)

  method gtk_xft_rgba : string
  (** The type of subpixel antialiasing to use.

      The possible values are none, rgb, bgr, vrgb, vbgr.

      Note that GSK does not support subpixel antialiasing, and this setting has
      no effect on font rendering in GTK. *)

  method set_gtk_xft_rgba : string -> unit
  (** The type of subpixel antialiasing to use.

      The possible values are none, rgb, bgr, vrgb, vbgr.

      Note that GSK does not support subpixel antialiasing, and this setting has
      no effect on font rendering in GTK. *)

  (** {2:conversions Conversions} *)

  method as_settings : Raw.Settings.t
end

(* High-level class for Settings *)
class settings (obj : Raw.Settings.t) : settings_t =
  object (self)
    inherit Style_provider.style_provider (Raw.Style_provider.from_gobject obj)

    method reset_property : string -> unit =
      fun name -> Raw.Settings.reset_property obj name

    method gtk_alternative_button_order =
      Raw.Settings.get_gtk_alternative_button_order obj

    method set_gtk_alternative_button_order v =
      Raw.Settings.set_gtk_alternative_button_order obj v

    method gtk_alternative_sort_arrows =
      Raw.Settings.get_gtk_alternative_sort_arrows obj

    method set_gtk_alternative_sort_arrows v =
      Raw.Settings.set_gtk_alternative_sort_arrows obj v

    method gtk_application_prefer_dark_theme =
      Raw.Settings.get_gtk_application_prefer_dark_theme obj

    method set_gtk_application_prefer_dark_theme v =
      Raw.Settings.set_gtk_application_prefer_dark_theme obj v

    method gtk_cursor_aspect_ratio =
      Raw.Settings.get_gtk_cursor_aspect_ratio obj

    method set_gtk_cursor_aspect_ratio v =
      Raw.Settings.set_gtk_cursor_aspect_ratio obj v

    method gtk_cursor_blink = Raw.Settings.get_gtk_cursor_blink obj
    method set_gtk_cursor_blink v = Raw.Settings.set_gtk_cursor_blink obj v
    method gtk_cursor_blink_time = Raw.Settings.get_gtk_cursor_blink_time obj

    method set_gtk_cursor_blink_time v =
      Raw.Settings.set_gtk_cursor_blink_time obj v

    method gtk_cursor_blink_timeout =
      Raw.Settings.get_gtk_cursor_blink_timeout obj

    method set_gtk_cursor_blink_timeout v =
      Raw.Settings.set_gtk_cursor_blink_timeout obj v

    method gtk_cursor_theme_name = Raw.Settings.get_gtk_cursor_theme_name obj

    method set_gtk_cursor_theme_name v =
      Raw.Settings.set_gtk_cursor_theme_name obj v

    method gtk_cursor_theme_size = Raw.Settings.get_gtk_cursor_theme_size obj

    method set_gtk_cursor_theme_size v =
      Raw.Settings.set_gtk_cursor_theme_size obj v

    method gtk_decoration_layout = Raw.Settings.get_gtk_decoration_layout obj

    method set_gtk_decoration_layout v =
      Raw.Settings.set_gtk_decoration_layout obj v

    method gtk_dialogs_use_header = Raw.Settings.get_gtk_dialogs_use_header obj

    method set_gtk_dialogs_use_header v =
      Raw.Settings.set_gtk_dialogs_use_header obj v

    method gtk_dnd_drag_threshold = Raw.Settings.get_gtk_dnd_drag_threshold obj

    method set_gtk_dnd_drag_threshold v =
      Raw.Settings.set_gtk_dnd_drag_threshold obj v

    method gtk_double_click_distance =
      Raw.Settings.get_gtk_double_click_distance obj

    method set_gtk_double_click_distance v =
      Raw.Settings.set_gtk_double_click_distance obj v

    method gtk_double_click_time = Raw.Settings.get_gtk_double_click_time obj

    method set_gtk_double_click_time v =
      Raw.Settings.set_gtk_double_click_time obj v

    method gtk_enable_accels = Raw.Settings.get_gtk_enable_accels obj
    method set_gtk_enable_accels v = Raw.Settings.set_gtk_enable_accels obj v
    method gtk_enable_animations = Raw.Settings.get_gtk_enable_animations obj

    method set_gtk_enable_animations v =
      Raw.Settings.set_gtk_enable_animations obj v

    method gtk_enable_event_sounds =
      Raw.Settings.get_gtk_enable_event_sounds obj

    method set_gtk_enable_event_sounds v =
      Raw.Settings.set_gtk_enable_event_sounds obj v

    method gtk_enable_input_feedback_sounds =
      Raw.Settings.get_gtk_enable_input_feedback_sounds obj

    method set_gtk_enable_input_feedback_sounds v =
      Raw.Settings.set_gtk_enable_input_feedback_sounds obj v

    method gtk_enable_primary_paste =
      Raw.Settings.get_gtk_enable_primary_paste obj

    method set_gtk_enable_primary_paste v =
      Raw.Settings.set_gtk_enable_primary_paste obj v

    method gtk_entry_password_hint_timeout =
      Raw.Settings.get_gtk_entry_password_hint_timeout obj

    method set_gtk_entry_password_hint_timeout v =
      Raw.Settings.set_gtk_entry_password_hint_timeout obj v

    method gtk_entry_select_on_focus =
      Raw.Settings.get_gtk_entry_select_on_focus obj

    method set_gtk_entry_select_on_focus v =
      Raw.Settings.set_gtk_entry_select_on_focus obj v

    method gtk_error_bell = Raw.Settings.get_gtk_error_bell obj
    method set_gtk_error_bell v = Raw.Settings.set_gtk_error_bell obj v
    method gtk_font_name = Raw.Settings.get_gtk_font_name obj
    method set_gtk_font_name v = Raw.Settings.set_gtk_font_name obj v
    method gtk_font_rendering = Raw.Settings.get_gtk_font_rendering obj
    method set_gtk_font_rendering v = Raw.Settings.set_gtk_font_rendering obj v

    method gtk_fontconfig_timestamp =
      Raw.Settings.get_gtk_fontconfig_timestamp obj

    method set_gtk_fontconfig_timestamp v =
      Raw.Settings.set_gtk_fontconfig_timestamp obj v

    method gtk_hint_font_metrics = Raw.Settings.get_gtk_hint_font_metrics obj

    method set_gtk_hint_font_metrics v =
      Raw.Settings.set_gtk_hint_font_metrics obj v

    method gtk_icon_theme_name = Raw.Settings.get_gtk_icon_theme_name obj

    method set_gtk_icon_theme_name v =
      Raw.Settings.set_gtk_icon_theme_name obj v

    method gtk_im_module = Raw.Settings.get_gtk_im_module obj
    method set_gtk_im_module v = Raw.Settings.set_gtk_im_module obj v

    method gtk_interface_color_scheme =
      Raw.Settings.get_gtk_interface_color_scheme obj

    method set_gtk_interface_color_scheme v =
      Raw.Settings.set_gtk_interface_color_scheme obj v

    method gtk_interface_contrast = Raw.Settings.get_gtk_interface_contrast obj

    method set_gtk_interface_contrast v =
      Raw.Settings.set_gtk_interface_contrast obj v

    method gtk_keynav_use_caret = Raw.Settings.get_gtk_keynav_use_caret obj

    method set_gtk_keynav_use_caret v =
      Raw.Settings.set_gtk_keynav_use_caret obj v

    method gtk_label_select_on_focus =
      Raw.Settings.get_gtk_label_select_on_focus obj

    method set_gtk_label_select_on_focus v =
      Raw.Settings.set_gtk_label_select_on_focus obj v

    method gtk_long_press_time = Raw.Settings.get_gtk_long_press_time obj

    method set_gtk_long_press_time v =
      Raw.Settings.set_gtk_long_press_time obj v

    method gtk_overlay_scrolling = Raw.Settings.get_gtk_overlay_scrolling obj

    method set_gtk_overlay_scrolling v =
      Raw.Settings.set_gtk_overlay_scrolling obj v

    method gtk_primary_button_warps_slider =
      Raw.Settings.get_gtk_primary_button_warps_slider obj

    method set_gtk_primary_button_warps_slider v =
      Raw.Settings.set_gtk_primary_button_warps_slider obj v

    method gtk_print_backends = Raw.Settings.get_gtk_print_backends obj
    method set_gtk_print_backends v = Raw.Settings.set_gtk_print_backends obj v

    method gtk_print_preview_command =
      Raw.Settings.get_gtk_print_preview_command obj

    method set_gtk_print_preview_command v =
      Raw.Settings.set_gtk_print_preview_command obj v

    method gtk_recent_files_enabled =
      Raw.Settings.get_gtk_recent_files_enabled obj

    method set_gtk_recent_files_enabled v =
      Raw.Settings.set_gtk_recent_files_enabled obj v

    method gtk_recent_files_max_age =
      Raw.Settings.get_gtk_recent_files_max_age obj

    method set_gtk_recent_files_max_age v =
      Raw.Settings.set_gtk_recent_files_max_age obj v

    method gtk_shell_shows_app_menu =
      Raw.Settings.get_gtk_shell_shows_app_menu obj

    method set_gtk_shell_shows_app_menu v =
      Raw.Settings.set_gtk_shell_shows_app_menu obj v

    method gtk_shell_shows_desktop =
      Raw.Settings.get_gtk_shell_shows_desktop obj

    method set_gtk_shell_shows_desktop v =
      Raw.Settings.set_gtk_shell_shows_desktop obj v

    method gtk_shell_shows_menubar =
      Raw.Settings.get_gtk_shell_shows_menubar obj

    method set_gtk_shell_shows_menubar v =
      Raw.Settings.set_gtk_shell_shows_menubar obj v

    method gtk_show_status_shapes = Raw.Settings.get_gtk_show_status_shapes obj

    method set_gtk_show_status_shapes v =
      Raw.Settings.set_gtk_show_status_shapes obj v

    method gtk_sound_theme_name = Raw.Settings.get_gtk_sound_theme_name obj

    method set_gtk_sound_theme_name v =
      Raw.Settings.set_gtk_sound_theme_name obj v

    method gtk_split_cursor = Raw.Settings.get_gtk_split_cursor obj
    method set_gtk_split_cursor v = Raw.Settings.set_gtk_split_cursor obj v
    method gtk_theme_name = Raw.Settings.get_gtk_theme_name obj
    method set_gtk_theme_name v = Raw.Settings.set_gtk_theme_name obj v

    method gtk_titlebar_double_click =
      Raw.Settings.get_gtk_titlebar_double_click obj

    method set_gtk_titlebar_double_click v =
      Raw.Settings.set_gtk_titlebar_double_click obj v

    method gtk_titlebar_middle_click =
      Raw.Settings.get_gtk_titlebar_middle_click obj

    method set_gtk_titlebar_middle_click v =
      Raw.Settings.set_gtk_titlebar_middle_click obj v

    method gtk_titlebar_right_click =
      Raw.Settings.get_gtk_titlebar_right_click obj

    method set_gtk_titlebar_right_click v =
      Raw.Settings.set_gtk_titlebar_right_click obj v

    method gtk_xft_antialias = Raw.Settings.get_gtk_xft_antialias obj
    method set_gtk_xft_antialias v = Raw.Settings.set_gtk_xft_antialias obj v
    method gtk_xft_dpi = Raw.Settings.get_gtk_xft_dpi obj
    method set_gtk_xft_dpi v = Raw.Settings.set_gtk_xft_dpi obj v
    method gtk_xft_hinting = Raw.Settings.get_gtk_xft_hinting obj
    method set_gtk_xft_hinting v = Raw.Settings.set_gtk_xft_hinting obj v
    method gtk_xft_hintstyle = Raw.Settings.get_gtk_xft_hintstyle obj
    method set_gtk_xft_hintstyle v = Raw.Settings.set_gtk_xft_hintstyle obj v
    method gtk_xft_rgba = Raw.Settings.get_gtk_xft_rgba obj
    method set_gtk_xft_rgba v = Raw.Settings.set_gtk_xft_rgba obj v
    method as_settings = obj
  end
