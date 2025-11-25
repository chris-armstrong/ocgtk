/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconTheme */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkIconTheme */
#ifndef Val_GtkIconTheme
#define GtkIconTheme_val(val) ((GtkIconTheme*)ext_of_val(val))
#define Val_GtkIconTheme(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkIconTheme */


CAMLexport CAMLprim value ml_gtk_icon_theme_new(value unit)
{
CAMLparam1(unit);
GtkIconTheme *obj = gtk_icon_theme_new();
CAMLreturn(Val_GtkIconTheme(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_set_theme_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_set_theme_name(GtkIconTheme_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_has_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_icon_theme_has_icon(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_search_path(value self)
{
CAMLparam1(self);

gtk_icon_theme_get_search_path(GtkIconTheme_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_resource_path(value self)
{
CAMLparam1(self);

gtk_icon_theme_get_resource_path(GtkIconTheme_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_sizes(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_get_icon_sizes(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_names(value self)
{
CAMLparam1(self);

gtk_icon_theme_get_icon_names(GtkIconTheme_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_search_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_add_search_path(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_resource_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_add_resource_path(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
