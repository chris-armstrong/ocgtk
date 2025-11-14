(** pango enums *)

type style = [ `NORMAL | `OBLIQUE | `ITALIC ]
type weight =
  [ `ULTRALIGHT | `LIGHT | `NORMAL | `BOLD | `ULTRABOLD | `HEAVY ]
type variant = [ `NORMAL | `SMALL_CAPS ]
type stretch =
  [ `ULTRA_CONDENSED | `EXTRA_CONDENSED | `CONDENSED | `SEMI_CONDENSED
  | `NORMAL | `SEMI_EXPANDED | `EXPANDED | `EXTRA_EXPANDED
  | `ULTRA_EXPANDED ]
type underline = [ `NONE | `SINGLE | `DOUBLE | `LOW ]
type wrap_mode = [ `WORD | `CHAR | `WORD_CHAR ]
type ellipsize_mode = [ `NONE | `START | `MIDDLE | `END ] 

(**/**)

module Conv = struct
  open Gpointer

  external _get_tables : unit ->
      style variant_table
    * weight variant_table
    * variant variant_table
    * stretch variant_table
    * underline variant_table
    * wrap_mode variant_table
    * ellipsize_mode variant_table
    = "ml_pango_get_tables"

  let style_tbl, weight_tbl, variant_tbl, stretch_tbl, underline_tbl,
      wrap_mode_tbl, ellipsize_mode_tbl = _get_tables ()

  let style = Gobject.Data.enum style_tbl
  let weight = Gobject.Data.enum weight_tbl
  let variant = Gobject.Data.enum variant_tbl
  let stretch = Gobject.Data.enum stretch_tbl
  let underline = Gobject.Data.enum underline_tbl
  let wrap_mode = Gobject.Data.enum wrap_mode_tbl
  let ellipsize_mode = Gobject.Data.enum ellipsize_mode_tbl
end
