
~~~INT~~~
; ModuleID = 'MicroC'

@j = global i32 0
@b = global i1 false
@i = global i32 0
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  store i32 42, i32* @i
  store i32 10, i32* @j
  %i = load i32, i32* @i
  %j = load i32, i32* @j
  %tmp = add i32 %i, %j
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %tmp)
  ret i32 0
}
