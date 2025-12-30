/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MenuLinkIter */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_g_menu_link_iter_next(value self)
{
CAMLparam1(self);

gboolean result = g_menu_link_iter_next(GMenuLinkIter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_menu_link_iter_get_value(value self)
{
CAMLparam1(self);

GMenuModel* result = g_menu_link_iter_get_value(GMenuLinkIter_val(self));
CAMLreturn(Val_GMenuModel(result));
}

CAMLexport CAMLprim value ml_g_menu_link_iter_get_next(value self)
{
CAMLparam1(self);
const gchar* out1;
GMenuModel* out2;

gboolean result = g_menu_link_iter_get_next(GMenuLinkIter_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_string(out1));
    Store_field(ret, 2, Val_GMenuModel(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_g_menu_link_iter_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_menu_link_iter_get_name(GMenuLinkIter_val(self));
CAMLreturn(caml_copy_string(result));
}
