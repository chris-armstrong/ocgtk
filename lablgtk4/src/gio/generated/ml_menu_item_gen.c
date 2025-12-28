/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MenuItem */

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


CAMLexport CAMLprim value ml_g_menu_item_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GMenuItem *obj = g_menu_item_new(String_option_val(arg1), String_option_val(arg2));
CAMLreturn(Val_GMenuItem(obj));
}

CAMLexport CAMLprim value ml_g_menu_item_new_from_model(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GMenuItem *obj = g_menu_item_new_from_model(GMenuModel_val(arg1), Int_val(arg2));
CAMLreturn(Val_GMenuItem(obj));
}

CAMLexport CAMLprim value ml_g_menu_item_new_section(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GMenuItem *obj = g_menu_item_new_section(String_option_val(arg1), GMenuModel_val(arg2));
CAMLreturn(Val_GMenuItem(obj));
}

CAMLexport CAMLprim value ml_g_menu_item_new_submenu(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GMenuItem *obj = g_menu_item_new_submenu(String_option_val(arg1), GMenuModel_val(arg2));
CAMLreturn(Val_GMenuItem(obj));
}

CAMLexport CAMLprim value ml_g_menu_item_set_submenu(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_item_set_submenu(GMenuItem_val(self), Option_val(arg1, GMenuModel_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_item_set_section(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_item_set_section(GMenuItem_val(self), Option_val(arg1, GMenuModel_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_item_set_link(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_item_set_link(GMenuItem_val(self), String_val(arg1), Option_val(arg2, GMenuModel_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_item_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_item_set_label(GMenuItem_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_item_set_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_item_set_icon(GMenuItem_val(self), GIcon_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_item_set_detailed_action(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_item_set_detailed_action(GMenuItem_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_item_get_link(value self, value arg1)
{
CAMLparam2(self, arg1);

GMenuModel* result = g_menu_item_get_link(GMenuItem_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GMenuModel));
}
