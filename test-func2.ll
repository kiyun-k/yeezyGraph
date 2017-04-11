
~~~INT~~~

~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %i = alloca i32
  store i32 1, i32* %i
  %i1 = load i32, i32* %i
  %tmp = add i32 %i1, 1
  store i32 %tmp, i32* %i
  store i32 2, i32* %i
  %fun_result = call i32 @fun(i32 2, i32 %tmp)
  %i2 = load i32, i32* %i
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %i2)
  ret i32 0
}

define i32 @fun(i32 %x, i32 %y) {
entry:
  %x1 = alloca i32
  store i32 %x, i32* %x1
  %y2 = alloca i32
  store i32 %y, i32* %y2
  ret i32 0
}
