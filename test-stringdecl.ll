
~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@str = private unnamed_addr constant [6 x i8] c"hello\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %s = alloca i8*
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str, i32 0, i32 0), i8** %s
  ret i32 0
}
