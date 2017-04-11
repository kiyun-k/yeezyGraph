
~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@str = private unnamed_addr constant [12 x i8] c"hello world\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %s = alloca i8*
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str, i32 0, i32 0), i8** %s
  %s1 = load i8*, i8** %s
  %printf = call i32 (i8*, ...) @printf(i8* %s1)
  ret i32 0
}
