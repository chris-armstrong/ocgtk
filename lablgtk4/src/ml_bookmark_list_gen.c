/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BookmarkList */

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

/* Type-specific conversion macros for GtkBookmarkList */
#ifndef Val_GtkBookmarkList
#define GtkBookmarkList_val(val) ((GtkBookmarkList*)ext_of_val(val))
#define Val_GtkBookmarkList(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBookmarkList */


CAMLexport CAMLprim value ml_gtk_bookmark_list_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBookmarkList *obj = gtk_bookmark_list_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkBookmarkList(obj));
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_set_io_priority(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bookmark_list_set_io_priority(GtkBookmarkList_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_set_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bookmark_list_set_attributes(GtkBookmarkList_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_is_loading(value self)
{
CAMLparam1(self);

gboolean result = gtk_bookmark_list_is_loading(GtkBookmarkList_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_io_priority(value self)
{
CAMLparam1(self);

int result = gtk_bookmark_list_get_io_priority(GtkBookmarkList_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_filename(value self)
{
CAMLparam1(self);

const char* result = gtk_bookmark_list_get_filename(GtkBookmarkList_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_attributes(value self)
{
CAMLparam1(self);

const char* result = gtk_bookmark_list_get_attributes(GtkBookmarkList_val(self));
CAMLreturn(caml_copy_string(result));
}
