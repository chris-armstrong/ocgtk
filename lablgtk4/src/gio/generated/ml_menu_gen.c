/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Menu */

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

/* Type-specific conversion macros for GMenu */
#ifndef Val_GMenu
#define GMenu_val(val) ((GMenu*)ext_of_val(val))
#define Val_GMenu(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GMenu */


CAMLexport CAMLprim value ml_g_menu_new(value unit)
{
CAMLparam1(unit);
GMenu *obj = g_menu_new();
CAMLreturn(Val_GMenu(obj));
}

CAMLexport CAMLprim value ml_g_menu_remove_all(value self)
{
CAMLparam1(self);

g_menu_remove_all(GMenu_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_remove(GMenu_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_prepend_submenu(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_prepend_submenu(GMenu_val(self), String_option_val(arg1), GMenuModel_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_prepend_section(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_prepend_section(GMenu_val(self), String_option_val(arg1), GMenuModel_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_prepend_item(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_prepend_item(GMenu_val(self), GMenuItem_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_prepend(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_prepend(GMenu_val(self), String_option_val(arg1), String_option_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_insert_submenu(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_menu_insert_submenu(GMenu_val(self), Int_val(arg1), String_option_val(arg2), GMenuModel_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_insert_section(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_menu_insert_section(GMenu_val(self), Int_val(arg1), String_option_val(arg2), GMenuModel_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_insert_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_insert_item(GMenu_val(self), Int_val(arg1), GMenuItem_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_insert(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_menu_insert(GMenu_val(self), Int_val(arg1), String_option_val(arg2), String_option_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_freeze(value self)
{
CAMLparam1(self);

g_menu_freeze(GMenu_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_append_submenu(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_append_submenu(GMenu_val(self), String_option_val(arg1), GMenuModel_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_append_section(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_append_section(GMenu_val(self), String_option_val(arg1), GMenuModel_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_append_item(value self, value arg1)
{
CAMLparam2(self, arg1);

g_menu_append_item(GMenu_val(self), GMenuItem_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_menu_append(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_menu_append(GMenu_val(self), String_option_val(arg1), String_option_val(arg2));
CAMLreturn(Val_unit);
}
