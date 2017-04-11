
~~~INT~~~
; ModuleID = 'MicroC'

@i = global i1 false
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %i = alloca i32
  store i32 42, i32* %i
  %i1 = load i32, i32* %i
  %i2 = load i32, i32* %i
  %tmp = add i32 %i1, %i2
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %tmp)
  ret i32 0
}
