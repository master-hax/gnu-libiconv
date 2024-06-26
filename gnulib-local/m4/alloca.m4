# alloca.m4
# serial 100
dnl Copyright (C) 2002-2024 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

AC_DEFUN([gl_FUNC_ALLOCA],
[
  dnl Work around a bug of AC_EGREP_CPP in autoconf-2.57.
  AC_REQUIRE([AC_PROG_CPP])
  AC_REQUIRE([AC_PROG_EGREP])

  AC_REQUIRE([AC_FUNC_ALLOCA])
  if test $ac_cv_func_alloca_works = no; then
    gl_PREREQ_ALLOCA
  fi

  # Define an additional variable used in the Makefile substitution.

  AC_EGREP_CPP([Need own alloca], [
#if defined __GNUC__ || defined _MSC_VER || !HAVE_ALLOCA_H
  Need own alloca
#endif
    ],
    [GL_GENERATE_ALLOCA_H=true],
    [GL_GENERATE_ALLOCA_H=false])
])

# Prerequisites of lib/alloca.c.
# STACK_DIRECTION is already handled by AC_FUNC_ALLOCA.
AC_DEFUN([gl_PREREQ_ALLOCA], [
  AC_CHECK_HEADERS_ONCE(stdlib.h string.h)
  :
])
