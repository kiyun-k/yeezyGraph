
~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %printbig = call i32 @printbig(i32 72)
  %printbig1 = call i32 @printbig(i32 69)
  %printbig2 = call i32 @printbig(i32 76)
  %printbig3 = call i32 @printbig(i32 76)
  %printbig4 = call i32 @printbig(i32 79)
  %printbig5 = call i32 @printbig(i32 32)
  %printbig6 = call i32 @printbig(i32 87)
  %printbig7 = call i32 @printbig(i32 79)
  %printbig8 = call i32 @printbig(i32 82)
  %printbig9 = call i32 @printbig(i32 76)
  %printbig10 = call i32 @printbig(i32 68)
  ret i32 0
}
