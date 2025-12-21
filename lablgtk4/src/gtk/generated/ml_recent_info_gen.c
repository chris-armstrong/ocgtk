/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RecentInfo */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkRecentInfo */
#ifndef Val_GtkRecentInfo
#define GtkRecentInfo_val(val) ((GtkRecentInfo*)ext_of_val(val))
#define Val_GtkRecentInfo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkRecentInfo */


CAMLexport CAMLprim value ml_gtk_recent_info_unref(value self)
{
CAMLparam1(self);

gtk_recent_info_unref(GtkRecentInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_recent_info_ref(value self)
{
CAMLparam1(self);

GtkRecentInfo* result = gtk_recent_info_ref(GtkRecentInfo_val(self));
CAMLreturn(Val_GtkRecentInfo(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_match(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_recent_info_match(GtkRecentInfo_val(self), GtkRecentInfo_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_last_application(value self)
{
CAMLparam1(self);

char* result = gtk_recent_info_last_application(GtkRecentInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_is_local(value self)
{
CAMLparam1(self);

gboolean result = gtk_recent_info_is_local(GtkRecentInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_has_group(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_recent_info_has_group(GtkRecentInfo_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_has_application(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_recent_info_has_application(GtkRecentInfo_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_uri_display(value self)
{
CAMLparam1(self);

char* result = gtk_recent_info_get_uri_display(GtkRecentInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_uri(value self)
{
CAMLparam1(self);

const char* result = gtk_recent_info_get_uri(GtkRecentInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_short_name(value self)
{
CAMLparam1(self);

char* result = gtk_recent_info_get_short_name(GtkRecentInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_private_hint(value self)
{
CAMLparam1(self);

gboolean result = gtk_recent_info_get_private_hint(GtkRecentInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_mime_type(value self)
{
CAMLparam1(self);

const char* result = gtk_recent_info_get_mime_type(GtkRecentInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_display_name(value self)
{
CAMLparam1(self);

const char* result = gtk_recent_info_get_display_name(GtkRecentInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_description(value self)
{
CAMLparam1(self);

const char* result = gtk_recent_info_get_description(GtkRecentInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_get_age(value self)
{
CAMLparam1(self);

int result = gtk_recent_info_get_age(GtkRecentInfo_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_recent_info_exists(value self)
{
CAMLparam1(self);

gboolean result = gtk_recent_info_exists(GtkRecentInfo_val(self));
CAMLreturn(Val_bool(result));
}
